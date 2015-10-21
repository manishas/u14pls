#!/bin/bash -e

apt-get update
apt-get install -y openjdk-6-jdk
echo 'export JAVA_HOME=/usr/lib/jvm/java-6-openjdk-amd64' >> $HOME/.bashrc
echo 'export PATH=$PATH:/usr/lib/jvm/java-6-openjdk-amd64/jre/bin' >> $HOME/.bashrc
. $HOME/.bashrc

for file in /tmp/version/*;
do
  . $file
done
