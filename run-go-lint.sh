#!/usr/bin/env bash

set -eu -o pipefail

if ! command -v staticcheck &> /dev/null ; then
    echo "golint not installed or available in the PATH" >&2
    echo "please check https://github.com/golang/lint" >&2
    exit 1
fi

failed=false

# redirect stderr so that violations and summaries are properly interleaved.
if ! staticcheck ./... 2>&1
then
    failed=true
fi

if [[ $failed == "true" ]]; then
    exit 1
fi
