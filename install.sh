#docker install
yum install docker -y
sudo systemctl restart docker
usermod -aG docker ec2-user
systemctl restart docker

#kubernetes install version 1.27
curl -LO https://dl.k8s.io/release/v1.27.4/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /bin/kubectl


#kubernetes bash-completion
source /usr/share/bash-completion/bash_completion
echo 'source <(kubectl completion bash)' >>~/.bashrc
echo 'alias k=kubectl' >>~/.bashrc
echo 'complete -o default -F __start_kubectl k' >>~/.bashrc
exec bash

#eksctl install version 0.148.0 ( k8s 1.26~1.27 )
ARCH=amd64
PLATFORM=$(uname -s)_$ARCH
curl -sLO "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_$PLATFORM.tar.gz"
curl -sL "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_checksums.txt" | grep $PLATFORM | sha256sum --check
tar -xzf eksctl_$PLATFORM.tar.gz -C /tmp && rm eksctl_$PLATFORM.tar.gz
sudo mv /tmp/eksctl /usr/local/bin

#helm install version v3.12.0 ( k8s 1.26 ~ 1.27 )
wget https://get.helm.sh/helm-v3.12.0-linux-amd64.tar.gz
tar zxvf helm-v3.12.0-linux-amd64.tar.gz
mv linux-amd64/helm /bin/

#awscli install
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
mv /usr/local/bin/aws /bin/
