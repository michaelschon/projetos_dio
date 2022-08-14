#!/bin/bash
# Owner: Michael Schon
# Bootcamp Linux Experience

# Verifica se esta com o usuario root:
if [ ${USER} != "root" ]; then
  echo "Eh necessario rodar este script como usuario root ou comando sudo!"
  exit 1
fi

echo "Fazendo update do ambiente"
dnf update -y

echo "Instalando pacotes"
dnf install -y unzip httpd

echo "Inicializando o serviço"
systemctl enable --now httpd

echo "Liberando regra de firewall"
firewall-cmd --permanent --add-port=80/tcp
firewall-cmd --reload

echo "Liberando permissão no SELinux"
semanage port -a -t http_port_t -p tcp 80

echo "Baixando website.."
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip -P /var/www/html

echo "Descompactando arquivo"
cd /var/www/html
unzip -q main.zip

echo "Movendo arquivos..."
mv /var/www/html/linux-site-dio-main/* /var/www/html/

echo "Removendo arquivos desnecessarios..."
rm -f /var/www/html/*.zip

echo "Ajustando permissões"
chown -R apache:apache /var/www/html

