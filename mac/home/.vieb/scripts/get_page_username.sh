#!/bin/bash

set -eu

APP_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd )"
. ${APP_PATH}/lib/bash/common.sh
. ${APP_PATH}/lib/bash/lpass.sh

url=$1
$lpass show --clip --username $(extract_lpass_name $url)
