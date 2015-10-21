#!/bin/bash 

sudo chmod 1777 /tmp/version

for file in /tmp/version/*;
do
  $file
done
