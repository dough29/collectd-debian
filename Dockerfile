FROM ubuntu
RUN apt-get update &&\
    apt-get -y install --no-install-recommends smartmontools collectd* libatasmart* libudev* &&\
    rm -rif /var/lib/apt/lists/*
COPY collectd.conf /etc/collectd/collectd.conf
CMD ["collectd", "-f"]
