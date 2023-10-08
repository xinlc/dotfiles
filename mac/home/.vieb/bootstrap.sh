#!/bin/bash

set -eu

APP_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )"

mkdir -p ~/.vieb/colors
ln -sfn $APP_PATH/viebrc ~/.vieb/viebrc
ln -sfn $APP_PATH/colors/custom.css ~/.vieb/colors/custom.css
ln -sfn $APP_PATH/scripts ~/.vieb/scripts
ln -sfn $APP_PATH/userstyle/ ~/.vieb/userstyle

if [[ ! -e ~/.viebrc_local ]]; then echo '" Local only settings here' > ~/.viebrc_local; fi
