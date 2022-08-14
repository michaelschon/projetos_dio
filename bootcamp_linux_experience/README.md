# Bootcamp Linux Experience

#### Aqui serão armazenados os desafios deste bootcamp

provisionamento.sh => Script para criação de diretorios, grupos e usuarios.

Output:
==========> CRIACAO
sudo ./provisionamento.sh
Criando diretórios..
Criando o diretorio publico...
Criando o diretorio adm...
Criando o diretorio ven...
Criando o diretorio sec...
Criando grupos de usuários...
Criando o grupo GRP_ADM
Criando o grupo GRP_VEN
Criando o grupo GRP_SEC
Criando usuários...
Criando o usuario carlos
Criando o usuario maria
Criando o usuario joao
Criando o usuario debora
Criando o usuario sebastiana
Criando o usuario roberto
Criando o usuario josefina
Criando o usuario amanda
Criando o usuario rogerio
Ajustando permissão do diretorio /publico
Ajustando permissão do diretorio /adm
Ajustando permissão do diretorio /ven
Ajustando permissão do diretorio /sec
Provisionamento de diretorios, grupos e usuarios concluidos

==========> REMOCAO
sudo ./provisionamento.sh
Criando diretórios..
Diretorio publico existe. Removendo...
Diretorio adm existe. Removendo...
Diretorio ven existe. Removendo...
Diretorio sec existe. Removendo...
Criando grupos de usuários...
Grupo GRP_ADM existe. Removendo...
Grupo GRP_VEN existe. Removendo...
Grupo GRP_SEC existe. Removendo...
Criando usuários...
Usuario carlos existe. Removendo...
Usuario maria existe. Removendo...
Usuario joao existe. Removendo...
Usuario debora existe. Removendo...
Usuario sebastiana existe. Removendo...
Usuario roberto existe. Removendo...
Usuario josefina existe. Removendo...
Usuario amanda existe. Removendo...
Usuario rogerio existe. Removendo...
Provisionamento de diretorios, grupos e usuarios concluidos

==========> VALIDACAO
uid=1001(carlos) gid=1002(GRP_ADM) groups=1002(GRP_ADM)
uid=1002(maria) gid=1002(GRP_ADM) groups=1002(GRP_ADM)
uid=1003(joao) gid=1002(GRP_ADM) groups=1002(GRP_ADM)
uid=1004(debora) gid=1003(GRP_VEN) groups=1003(GRP_VEN)
uid=1005(sebastiana) gid=1003(GRP_VEN) groups=1003(GRP_VEN)
uid=1006(roberto) gid=1003(GRP_VEN) groups=1003(GRP_VEN)
uid=1007(josefina) gid=1004(GRP_SEC) groups=1004(GRP_SEC)
uid=1008(amanda) gid=1004(GRP_SEC) groups=1004(GRP_SEC)
uid=1009(rogerio) gid=1004(GRP_SEC) groups=1004(GRP_SEC)
drwxrwxrwx. 1 root root 0 Aug 13 21:10 /publico
drwxrwx---. 1 root GRP_ADM 0 Aug 13 21:10 /adm
drwxrwx---. 1 root GRP_VEN 0 Aug 13 21:10 /ven
drwxrwx---. 1 root GRP_SEC 0 Aug 13 21:10 /sec

configure-server.sh => implementa o webserver solicitado no bootcamp

OUTPUT:

sudo ./configure_server.sh
Fazendo update do ambiente
Last metadata expiration check: 1:37:25 ago on Sat 13 Aug 2022 07:51:24 PM -03.
Dependencies resolved.
Nothing to do.
Complete!
Instalando pacotes
Last metadata expiration check: 1:37:27 ago on Sat 13 Aug 2022 07:51:24 PM -03.
Package unzip-6.0-57.fc36.x86_64 is already installed.
Package httpd-2.4.54-3.fc36.x86_64 is already installed.
Dependencies resolved.
Nothing to do.
Complete!
Inicializando o serviço
Liberando regra de firewall
success
success
Liberando permissão no SELinux
ValueError: Port tcp/80 already defined
Baixando website..
--2022-08-13 21:28:54--  https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip
Resolving github.com (github.com)... 20.201.28.151
Connecting to github.com (github.com)|20.201.28.151|:443... connected.
HTTP request sent, awaiting response... 302 Found
Location: https://codeload.github.com/denilsonbonatti/linux-site-dio/zip/refs/heads/main [following]
--2022-08-13 21:28:54--  https://codeload.github.com/denilsonbonatti/linux-site-dio/zip/refs/heads/main
Resolving codeload.github.com (codeload.github.com)... 20.201.28.149
Connecting to codeload.github.com (codeload.github.com)|20.201.28.149|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 17218148 (16M) [application/zip]
Saving to: ‘/var/www/html/main.zip’

main.zip                                 100%[=================================================================================>]  16.42M  10.8MB/s    in 1.5s

2022-08-13 21:28:56 (10.8 MB/s) - ‘/var/www/html/main.zip’ saved [17218148/17218148]

Descompactando arquivo
Movendo arquivos...
Removendo arquivos desnecessarios...
Ajustando permissões

