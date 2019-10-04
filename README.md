# gregewing/collectd:latest




This is a simple Ubuntu base with <code>collectd</code> and <code>smartmontools</code> installed, which provides <code>smartctl</code> allowing this container to monitor the SMART statistics for the physical drives in the host computer.  It comes pre-configured to push metrics gathered to a graphite instance that you will need to create (or already have).  

You can configure the container to use a specific graphite instance by updating the smart plugin configuration in the provided collectd.cong file, or by providing your own replacement collectd.conf file by way of a volume or bind-mounted file.  I'll leave it up to you to decide which, but this config facilitates both approaches with a little careful confguration of the docker parameters.

Make whatever other configuration changes are necessary in /etc/collectd/collectd.conf to meet your requirements.

Create a container using this image with :

<code>
docker run -d -it --privileged \<br>
  --name=collectd \<br>
  -e TZ=Europe/London \<br>
  -v /var/lib/docker/volumes/collectd-config/_data/:/config \<br>
  -v /var/lib/docker/volumes/collectd-config/_data/collectd.conf:/etc/collectd/collectd.conf \<br>
  --restart unless-stopped \<br>
  gregewing/collectd
</code>
<br>


<b>Notes</b><br>
<ul type="disc"><li>I've connected a volume to this container at <code>/config/</code> purely as a safe holding place for the collectd.config file.  Attaching it like this means the volume containing the config file does not show up as unused in docker, which means it might be deleted when pruning stale volumes.</li>
<li>For the 'df' plugin to provide data on mounts and RAID volumes on the host, you may need to add a read-only bind mount to this container. </li>
<li>This build will be updated monthly to ensure the Ubuntu build, and the software installed in the container are up to date.</li>
<li>If you would like to customise this container further, use this <a href="https://github.com/gregewing/collectd/blob/master/Dockerfile">Dockerfile</a>.</li>
</ul>
