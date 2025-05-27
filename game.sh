#!/bin/bash

target=$((RANDOM % 10 + 1))
tries=0

while true; do
  read -p "Guess (1-10): " guess
  ((tries++))
  if [ "$guess" -eq "$target" ]; then
    echo "Correct! You guessed it in $tries tries."
    break
  elif [ "$guess" -lt "$target" ]; then
    echo "Too low!"
  else
    echo "Too high!"
  fi
done
