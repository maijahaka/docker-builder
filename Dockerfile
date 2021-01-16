FROM ubuntu:18.04

RUN apt-get update && apt-get install -y \
    git apt-transport-https ca-certificates curl gnupg-agent \
    software-properties-common && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
    apt-key add - && \
    add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable" && \
    apt-get update && apt-get install docker-ce-cli

COPY ./docker-builder.sh /usr/local/bin
RUN chmod 755 /usr/local/bin/docker-builder.sh

ENTRYPOINT ["/usr/local/bin/docker-builder.sh"]