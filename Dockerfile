FROM jenkins/jenkins:lts

USER root

RUN apt-get update && apt-get install --no-install-recommends -y \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg2 \
        nano \
        iputils-ping \
        software-properties-common && \
    curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey && \
    add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
        $(lsb_release -cs) \
        stable" && \
    apt-get update && \
    apt-get install -y docker-ce

EXPOSE 8080 50000
