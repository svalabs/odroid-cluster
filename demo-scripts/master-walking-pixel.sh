#!/bin/bash

while [ true ]
do
  for stack in {1..4}
  do
    for node in {1..4}
    do
      for led in {0..5}
      do
        curl --silent http://mc1-${stack}-${node}:5000/blink?value=${led}.0.0.255 > /dev/null
        curl --silent http://mc1-${stack}-${node}:5000/blink?value=${led}.0.0.0   > /dev/null
      done
    done
  done
done
