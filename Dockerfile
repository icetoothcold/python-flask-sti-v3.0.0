
# python-flask-sti
FROM python:2.7.14

MAINTAINER lydong lydong@travelsky.com

ENV BUILDER_VERSION 3.0.0
ENV PYTHON_VERSION 2.7.14
LABEL io.openshift.s2i.scripts-url=image:///usr/libexec/s2i \
      io.k8s.description="Platform for building python2.7.14 flask sti" \
      io.k8s.display-name="builder python2.7.14 flask sti" \
      io.openshift.expose-services="5000:http" \
      io.openshift.tags="builder python2.7.14 flask sti."
COPY pip.conf /etc/pip.conf
COPY ./s2i/bin/ /usr/libexec/s2i

RUN mkdir -p /opt/app-root && \
chown -R 1001:1001 /opt/app-root && \
mkdir /.local && \
chown -R 1001:1001 /.local

USER 1001
WORKDIR /opt/app-root
EXPOSE 5000

# TODO: Set the default CMD for the image
CMD ["/usr/libexec/s2i/usage"]
