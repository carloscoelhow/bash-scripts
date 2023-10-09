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

#!/bin/bash
sudo apt update
sudo apt install gcc -y
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-ubuntu2204.pin
sudo mv cuda-ubuntu2204.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/12.1.1/local_installers/cuda-repo-ubuntu2204-12-1-local_12.1.1-530.30.02-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu2204-12-1-local_12.1.1-530.30.02-1_amd64.deb 
sudo cp /var/cuda-repo-ubuntu2204-12-1-local/cuda-*-keyring.gpg /usr/share/keyrings/
sudo apt  update
sudo apt install cuda -y
sudo apt install nvtop -y
sudo sleep 2

#!/bin/bash
distribution=$(. /etc/os-release; echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list

#sudo apt update && sudo apt-get install -y nvidia-container-toolkit
sudo apt update 
sudo apt install nvidia-container-toolkit -y
sudo systemctl restart docker

#https://github.com/NVIDIA/nvidia-docker/issues/1243
#install codedeploy agent
#!/bin/bash
sudo apt update
sudo apt install ruby-full -y
sudo apt install wget -y
wget https://aws-codedeploy-us-east-1.s3.us-east-1.amazonaws.com/latest/install
chmod +x ./install
sudo ./install auto

#install apagado automatico
#!/bin/bash
sudo printf '%s\n' '#!/bin/bash' 'sleep 3600' 'sudo shutdown now' > /usr/bin/apagado.sh
sudo chmod +x /usr/bin/apagado.sh
sudo printf '%s\n' '[Unit]' 'Description=Scrip para apagado automatico de la instancia después de una hora' '' '[Service]' 'ExecStart=/usr/bin/apagado.sh' '' '[Install]' 'WantedBy=multi-user.target' > /lib/systemd/system/apagado-automatico.service
sudo systemctl daemon-reload
sudo systemctl enable apagado-automatico.service
sudo systemctl start apagado-automatico.service
sudo systemctl status apagado-automatico.service
