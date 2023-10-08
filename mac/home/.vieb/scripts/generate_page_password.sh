#!/bin/bash

set -eu

APP_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd )"
. ${APP_PATH}/lib/bash/common.sh
. ${APP_PATH}/lib/bash/lpass.sh

function update_lpass_password() {
    lpass_id=`$lpass show --id "$1" || echo $1` # if id is not found, use the given name

    $lpass generate --url "$1" $lpass_id 20 > /dev/null
    sleep 2 # previous command completes asynchronously, so a slight wait is needed
    $lpass edit $lpass_id
}

url=$1
lpass_name=$(extract_lpass_name $url)

if $($lpass show $lpass_name > /dev/null 2>&1); then # if password exists
    read -r -p "Password already exists, generate and override? [y/N]" -n 1 response
    echo
    case $response in
      [yY]) update_lpass_password $lpass_name;;
      *) exit 0;;
    esac
else
    update_lpass_password $lpass_name
fi
