ARG VARIANT=focal
ARG USERNAME=vscode

FROM mcr.microsoft.com/vscode/devcontainers/base:${VARIANT}

RUN wget https://packages.microsoft.com/config/ubuntu/20.10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
RUN sudo dpkg -i packages-microsoft-prod.deb

# [Optional] Uncomment this section to install additional OS packages.
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -y git ca-certificates curl apt-transport-https lsb-release gnupg \
    && curl -sL https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | tee /etc/apt/trusted.gpg.d/microsoft.gpg > /dev/null \
    && echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ focal main" | tee /etc/apt/sources.list.d/azure-cli.list \
    && apt-get update \
    && apt-get -y install --no-install-recommends curl jq azure-cli unzip make 

WORKDIR /tmp


# Install direnv 
RUN curl -sfL https://direnv.net/install.sh | bash

# Configure .local folder
WORKDIR /home/vscode/.local
COPY ./scripts/postlaunch.sh .
COPY ./scripts/.envrc .
RUN chown -R vscode:vscode /home/vscode/.local

# Cleanup apt
RUN apt-get autoremove -y \
    && apt-get clean -y 

USER ${USERNAME}
WORKDIR /home/vscode/work


