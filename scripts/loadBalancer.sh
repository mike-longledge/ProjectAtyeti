#!/bin/bash

declare -A endpoint

endpoint[primary-1-url]="https://primary-1-juucpiowaa-ue.a.run.app"
endpoint[primary-2-url]="https://primary-2-juucpiowaa-ue.a.run.app"
endpoint[secondary-1-url]="https://secondary-1-jecs2yle3a-uc.a.run.app"
endpoint[secondary-2-url]="https://secondary-2-jecs2yle3a-uc.a.run.app"

function check_health () {
   curl -f ${endpoint[${1}-1-url]} &>/dev/null  && \
     curl -f ${endpoint[${1}-2-url]} &>/dev/null 
   echo $?
}

function round_robin() {
   curl -f ${endpoint[${1}-1-url]}
   curl -f ${endpoint[${1}-2-url]}
   echo
}

while true; do
 if [[ $(check_health primary) == '0' ]]; then
  round_robin primary
 elif [[ $(check_health secondary) == '0' ]]; then
  round_robin secondary
 else 
  printf '\n\n\n====> Atyeti: Both Primary & Secondary Regions are Down!'
 fi
 sleep 2
done
