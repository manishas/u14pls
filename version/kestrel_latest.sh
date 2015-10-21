#!/bin/bash -e

# Make sure Java is installed
java_version=$(java -version 2>&1 | awk -F '"' '/version/ {print $2}')
if [[ -z "$java_version" ]]; then
  echo "Kestrel needs Java to be installed on your system. Exiting."
  exit 1
fi


# Install sbt
sudo wget http://repo.typesafe.com/typesafe/ivy-releases/org.scala-tools.sbt/sbt-launch/0.11.2/sbt-launch.jar
sudo mv sbt-launch.jar /usr/local/bin/sbt-launch.jar
sudo echo 'SBT_OPTS="-Xms512M -Xmx1536M -Xss1M -XX:+CMSClassUnloadingEnabled -XX:MaxPermSize=256M"' > /usr/local/bin/sbt
sudo echo 'java $SBT_OPTS -jar `dirname $0`/sbt-launch.jar "$@"' >> /usr/local/bin/sbt
sudo chmod +x /usr/local/bin/sbt

# Install kestrel
sudo git clone https://github.com/robey/kestrel /usr/local/kestrel
cd /usr/local/kestrel
sbt clean update package-dist

# Run kestrel
#/usr/local/kestrel/dist/kestrel/scripts/devel.sh
