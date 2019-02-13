#!/bin/bash

declare -a loopia=()

while IFS='' read -r line || [[ -n "$line" ]]; do
    loopia+=($line)
done < "$1"

for domain in "${loopia[@]:2}"
do
    curl -s --user "${loopia[0]}:${loopia[1]}" "https://dyndns.loopia.se?hostname=$domain""&myip="`curl -s  dyndns.loopia.se/checkip | sed 's/^.*: \([^<]*\).*$/\1/'`; echo
done