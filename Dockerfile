FROM debian:buster
ENV     DEBIAN_FRONTEND noninteractive
RUN apt update \
    && apt -y install --no-install-recommends smartmontools collectd* libatasmart* libudev* lm-sensors\
    && apt clean\
    && rm -rf /var/lib/apt/lists/*
CMD ["collectd", "-f"]
