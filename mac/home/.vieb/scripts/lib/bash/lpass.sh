#!/bin/bash

set -eu

export lpass="$brew_bin/lpass"

function extract_lpass_name() {
    $sed 's_https\?://\(www\.\)\?\([^/]*\).*_\2_' <(echo $1)
}
