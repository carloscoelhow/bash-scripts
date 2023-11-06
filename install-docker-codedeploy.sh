#!/bin/bash
## install docker para ubuntu 22.04
sudo apt update
sudo apt upgrade -y
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
#apt-cache policy docker-ce
sudo apt install docker-ce -y
sudo usermod -aG docker ${USER}
sudo apt install docker-compose -y
sudo sleep 2

#install codedeploy agent
#!/bin/bash
sudo apt update
sudo apt install ruby-full -y
sudo apt install wget -y
wget https://aws-codedeploy-eu-west-1.s3.eu-west-1.amazonaws.com/latest/install
chmod +x ./install
sudo ./install auto
