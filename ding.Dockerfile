ARG  FROM_IMAGE
FROM ${FROM_IMAGE}

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN \
    apt-get update -y && \
    apt-get install -y gnupg zip unzip wget curl make
RUN \
    apt-get install -y language-pack-ja japan* language-pack-zh* chinese* language-pack-ko korean* && \
    apt-get install -y fonts-arphic-ukai fonts-arphic-uming fonts-ipafont-mincho fonts-ipafont-gothic fonts-unfonts-core

ARG BROWSER
ADD installs/${BROWSER}.sh browser_install.sh
RUN \
    chmod +x ./browser_install.sh && \
    ./browser_install.sh

RUN \
    echo "bingo!"

COPY  . /miniwob-plusplus/
WORKDIR /miniwob-plusplus/
RUN pip install -e .[testing] --no-cache-dir
