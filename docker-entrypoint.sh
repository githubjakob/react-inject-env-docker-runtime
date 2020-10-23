#!/bin/sh
set -o errexit
set -o nounset

## This script allows to inject env variables into react
## The script runs in the docker container just before react starts up
## The output of this is script is appended to /public/env_vars.js which is made accessible to typescript via index.html

cat <<EOF > /usr/src/app/build/env_vars.js
window.API_URL="$API_URL";
EOF

serve -s ./build/ -l 8080
