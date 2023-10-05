#!/bin/bash
#para crear este script hacer 
#"nano apagado.sh" en la terminal de la instancia
#copiar y pegar todo el contenido de este 
#este archivo y guardarlo. luego en la terminal hacer
#"sudo bash apagado.sh"
#por defecto está 7200 segundos (dos horas)
#pero se puede cambiarlo para cuantas horas se quiera
sudo printf '%s\n' '#!/bin/bash' 'sleep 7200' 'sudo shutdown now' > /usr/bin/apagado.sh
sudo chmod +x /usr/bin/apagado.sh
sudo printf '%s\n' '[Unit]' 'Description=Scrip para apagado automatico de la instancia después de una hora' '' '[Service]' 'ExecStart=/usr/bin/apagado.sh' '' '[Install]' 'WantedBy=multi-user.target' > /lib/systemd/system/apagado_automatico.service
sudo systemctl daemon-reload
sudo systemctl enable apagado_automatico.service
sudo systemctl start apagado_automatico.service
#sudo systemctl status apagado_automatico.service
echo "apagado automático creado"
