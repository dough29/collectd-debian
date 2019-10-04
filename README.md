# gregewing/collectd:latest
Ubuntu base with collectd and smartmontools (for smartctl) and write to graphite


This is a simple Ubuntu base with collectd and smartmontools installed. it comes pre-configured to push metrics gathered to a graphite instance that you will need to create (or already have). It is intended to be used to provide containerised collectd to monitor the physical host that the container is running on.

Make whatever configuration changes are necessary in /etc/collectd/collectd.conf, preferrably using a volume for persistence.

create a container using this image with :

docker run -d -it --privileged \ --name=collectd \ -e TZ=Europe/London \ -v /var/lib/docker/volumes/collectd-config/_data/:/config \ -v /var/lib/docker/volumes/collectd-config/_data/collectd.conf:/etc/collectd/collectd.conf \ --restart unless-stopped \ gregewing/collectd

For the 'df' plugin to provide data on mounts and RAID volumes on the host, you may need to add a read-only bind mount to this container.
