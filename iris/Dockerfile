FROM containers.intersystems.com/intersystems/iris:2024.3

USER root

RUN DEBIAN_FRONTEND=noninteractive \
  && apt-get update \
  && apt-get upgrade -y \
  && apt-get purge -y linux-libc-dev \
  && apt-get autoremove -y \
  && rm -rf /var/lib/apt/lists/* \
  && rm -fr /usr/irissys/fop \
  && rm -fr /usr/irissys/dev/java/lib/1.8/intersystems-cloudclient-*.jar

USER irisowner

WORKDIR /home/irisowner

COPY /configmap ./iris/configmap