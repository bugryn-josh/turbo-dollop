#!/bin/bash

set -eo pipefail

printf "%s\n" $GITHUB_REPOSITORY

printf "%s\n" $GITHUB_WORKSPACE

if [ $(echo ${GITHUB_REPOSITORY} | wc -c) -eq 1 ] ; then
  echo -e "\033[31mRepository cannot be empty\033[0m"
  exit 1
fi


curl --request GET \
  --url https://api.github.com/repos/${GITHUB_REPOSITORY}/milestones \
  --header "Authorization: Bearer ${GITHUB_TOKEN}" \
  --header 'Content-Type: application/json' \
  -o /response.json

printf "%s\n" "CAT output"

cat /response.json

printf "%s\n" "response.json output"

printf "%s\n" "$(echo < /response.json)"

sleep 3

printf "%s\n" "milestones output"


printf "::set-output name=milestones::%s" $(cat /response.json | jq -c .)