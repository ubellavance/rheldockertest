# My cool Docker image
# Version 1

# If you loaded redhat-rhel-server-7.0-x86_64 to your local registry, uncomment this FROM line instead:
# FROM registry.access.redhat.com/rhel
# Pull the rhel image from the local registry
FROM registry.access.redhat.com/rhel

MAINTAINER Ugo Bellavance
USER root

# Update image
RUN yum repolist --disablerepo=* && \
    yum-config-manager --disable \* > /dev/null && \
    yum-config-manager --enable rhel-7-server-rpms > /dev/null
RUN yum update -y
# Add httpd package. procps and iproute are only added to investigate the image later.
RUN yum install httpd procps iproute -y
RUN echo container.example.com > /etc/hostname

# Create an index.html file
RUN bash -c 'echo "Your Web server test is successful." >> /var/www/html/index.html'
