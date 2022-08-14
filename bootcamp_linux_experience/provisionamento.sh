#!/bin/bash

# Owner: Michael Schon
# Bootcamp Linux Experience

# Verifica se esta com o usuario root:
if [ ${USER} != "root" ]; then
  echo "Eh necessario rodar este script como usuario root ou comando sudo!"
  exit 1
fi

echo "Criando diretórios.."

for diretorio in publico adm ven sec; do
  if [ -d /${diretorio} ]; then
    echo "Diretorio ${diretorio} existe. Removendo..."
    rm -rf /${diretorio}
  else
    echo "Criando o diretorio ${diretorio}..."
    mkdir -m 770 /${diretorio}
  fi
done

echo "Criando grupos de usuários..."

for grupos in GRP_ADM GRP_VEN GRP_SEC; do
  VERIFICA_GRUPO=$(grep -w ${grupos} /etc/group | cut -f1 -d':')
  if [ "${VERIFICA_GRUPO}" == "${grupos}" ]; then
    echo "Grupo ${grupos} existe. Removendo..."
    groupdel -f ${grupos}
  else
    echo "Criando o grupo ${grupos}"
    groupadd ${grupos}
  fi
done

echo "Criando usuários..."

for usuarios_adm in carlos maria joao; do
  VERIFICA_USER=$(grep -w ${usuarios_adm} /etc/passwd | cut -f1 -d':')
  if [ "${VERIFICA_USER}" == "${usuarios_adm}" ]; then
    echo "Usuario ${usuarios_adm} existe. Removendo..."
    userdel -r ${usuarios_adm}
  else
    echo "Criando o usuario ${usuarios_adm}"
    useradd -g GRP_ADM -m -s /bin/bash ${usuarios_adm} #-p $(openssl passwd -crypt Senha123) ${usuarios_adm}
    echo "${usuarios_adm}:Senha123" | chpasswd
  fi
done

for usuarios_ven in debora sebastiana roberto; do
  VERIFICA_USER=$(grep -w ${usuarios_ven} /etc/passwd | cut -f1 -d':')
  if [ "${VERIFICA_USER}" == "${usuarios_ven}" ]; then
    echo "Usuario ${usuarios_ven} existe. Removendo..."
    userdel -r ${usuarios_ven}
  else
    echo "Criando o usuario ${usuarios_ven}"
    useradd -g GRP_VEN -m -s /bin/bash ${usuarios_ven}
    echo "${usuarios_adm}:Senha123" | chpasswd
  fi
done

for usuarios_sec in josefina amanda rogerio; do
  VERIFICA_USER=$(grep -w ${usuarios_sec} /etc/passwd | cut -f1 -d':')
  if [ "${VERIFICA_USER}" == "${usuarios_sec}" ]; then
    echo "Usuario ${usuarios_sec} existe. Removendo..."
    userdel -r ${usuarios_sec}
  else
    echo "Criando o usuario ${usuarios_sec}"
    useradd -g GRP_SEC -m -s /bin/bash ${usuarios_sec}
    echo "${usuarios_adm}:Senha123" | chpasswd
  fi
done

if [ -d /publico ]; then
  echo "Ajustando permissão do diretorio /publico"
  chmod 777 /publico
fi
if [ -d /adm ]; then
  echo "Ajustando permissão do diretorio /adm"
  chgrp -R GRP_ADM /adm
fi
if [ -d /ven ]; then
  echo "Ajustando permissão do diretorio /ven"
  chgrp -R GRP_VEN /ven
fi
if [ -d /sec ]; then
  echo "Ajustando permissão do diretorio /sec"
  chgrp -R GRP_SEC /sec
fi

echo "Provisionamento de diretorios, grupos e usuarios concluidos"
exit 0

#echo "Validacao"
#for usuarios in carlos maria joao debora sebastiana roberto josefina amanda rogerio; do
#  id ${usuarios}
#done
#for diretorios in /publico /adm /ven /sec; do
#  ls -ld ${diretorios}
#done
