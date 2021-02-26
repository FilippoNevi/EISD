FROM centos:7

RUN yum update -y
RUN yum install -y glibc.i686 sharutils ksh libX11 libXext libXft numactl net-tools libXtst vim-enhanced libXp
RUN yum groupinstall "Development Tools" -y
RUN adduser -u 1001 -m -U user
RUN echo "alias ll='ls -la'" >> /home/user/.bashrc

USER user
WORKDIR /home/user
ENV LM_LICENSE_FILE=1717@157.27.6.46
ENV MGC_HOME=/opt/mentor
ENV USER=user
ENV AMS_JAVA_MEMORY_HEAP="-Xms100M -Xmx10000M"
ENV MGC_AMS_HOME=/opt/mentor/questasim
ENV TESSENT_HOME=/opt/mentor/tessent
ENV PATH=${PATH}:/opt/mentor/questasim/bin:/opt/mentor/tessent/bin

CMD [ "/bin/bash", "--rcfile", "/home/user/.bashrc" ]
