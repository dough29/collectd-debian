# dough29/collectd-debian:latest

## Fork from gregewing/collectd

This is a simple Debian based image with <code>collectd</code>.

## Get the default "collectd.conf"

docker run --rm --entrypoint cat dough29/collectd-debian:latest /etc/collectd/collectd.conf > collectd.conf

## Create container

docker run -d -it --privileged\
  --name=collectd\
  -e TZ=Europe/Paris\
  -v /path/to/collectd.conf:/etc/collectd/collectd.conf\
  --restart unless-stopped dough29/collectd-debian
