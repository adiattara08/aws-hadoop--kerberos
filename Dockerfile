# Utilisez l'image Alpine comme base
FROM alpine

# Installez les packages nécessaires (Bash, Terraform et AWS CLI)
RUN apk update && \
    apk add --no-cache bash curl unzip && \
    curl -LO https://releases.hashicorp.com/terraform/1.7.2/terraform_1.7.2_linux_amd64.zip && \
    unzip terraform_1.7.2_linux_amd64.zip -d /usr/local/bin/ && \
    rm terraform_1.7.2_linux_amd64.zip && \
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm awscliv2.zip && \
    rm -rf ./aws


