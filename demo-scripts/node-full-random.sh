#!/bin/bash

while [ true ]
do
curl --silent $(hostname -i):31000/blink?value=5.$((0 + RANDOM % 255)).$((0 + RANDOM % 255)).$((0 + RANDOM % 255)) > /dev/null
curl --silent $(hostname -i):31000/blink?value=4.$((0 + RANDOM % 255)).$((0 + RANDOM % 255)).$((0 + RANDOM % 255)) > /dev/null
curl --silent $(hostname -i):31000/blink?value=3.$((0 + RANDOM % 255)).$((0 + RANDOM % 255)).$((0 + RANDOM % 255)) > /dev/null
curl --silent $(hostname -i):31000/blink?value=0.$((0 + RANDOM % 255)).$((0 + RANDOM % 255)).$((0 + RANDOM % 255)) > /dev/null
curl --silent $(hostname -i):31000/blink?value=1.$((0 + RANDOM % 255)).$((0 + RANDOM % 255)).$((0 + RANDOM % 255)) > /dev/null
curl --silent $(hostname -i):31000/blink?value=2.$((0 + RANDOM % 255)).$((0 + RANDOM % 255)).$((0 + RANDOM % 255)) > /dev/null
curl --silent $(hostname -i):31000/blink?value=5.$((0 + RANDOM % 255)).$((0 + RANDOM % 255)).$((0 + RANDOM % 255)) > /dev/null
curl --silent $(hostname -i):31000/blink?value=4.$((0 + RANDOM % 255)).$((0 + RANDOM % 255)).$((0 + RANDOM % 255)) > /dev/null
curl --silent $(hostname -i):31000/blink?value=3.$((0 + RANDOM % 255)).$((0 + RANDOM % 255)).$((0 + RANDOM % 255)) > /dev/null
curl --silent $(hostname -i):31000/blink?value=0.$((0 + RANDOM % 255)).$((0 + RANDOM % 255)).$((0 + RANDOM % 255)) > /dev/null
curl --silent $(hostname -i):31000/blink?value=1.$((0 + RANDOM % 255)).$((0 + RANDOM % 255)).$((0 + RANDOM % 255)) > /dev/null
curl --silent $(hostname -i):31000/blink?value=2.$((0 + RANDOM % 255)).$((0 + RANDOM % 255)).$((0 + RANDOM % 255)) > /dev/null
done
