#!/usr/bin/env bash

set -e

# trap ctrl-c and call ctrl_c()
trap ctrl_c SIGINT

function ctrl_c() {
    echo "** trapped CTRL-C"
    bash docker-compose.bash down
}

bash docker-compose.bash up &
PID=$!

while [[ ! "${TOKEN}" ]]
do
    TOKEN="$(bash docker-compose.bash logs | grep '\?token=' | tail -1 | awk -F'[=]' '{print $2}' | awk '{print $1}')"
    echo "** token='${TOKEN}'"
    sleep 1s
done

URL='http://localhost:9999'

xdg-open "${URL}/?token=${TOKEN}"

echo "** waiting for pid: ${PID}"
wait ${PID}
