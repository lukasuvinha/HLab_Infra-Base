#!/usr/bin/env *sh 

### Verificar conexão com insternet
echo "
Verificando o acesso à internet..."


ping -c 10 www.google.com.br  1> /dev/null 2> /dev/null


if [ "$?" -eq "0" ];
then 

      echo -e "\e[1;32m\n[VERIFICADO] - Conexão com à internet funcionando normalmente.\n\e[0m"

      sleep 30
else 

     echo -e "\e[1;31m\n[ERRO] - Seu sistema não tem conexão com à internet. Verifique os cabos e o modem.\n\e[0m"

     exit

fi

### Variaveis
PROGRAMAS_PARA_INSTALAR=(
  fail2ban
  zsh
  git

)
DIRETORIO_DOWNLOADS="$HOME/Downloads/Programas"

### Removendo travas eventuais do apt
sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock

### Atualizando o repositório ##
sudo apt update -y

### Adicionando repositórios de terceiros e suporte a Snap (Driver Logitech, Lutris e Drivers Nvidia)##
#sudo apt-add-repository "$VARIAVEL" -y
#sudo add-apt-repository "$VARAVEL" -y


###----------------------------- EXECUÇÃO -----------------------------###

### Atualizando o repositório depois da adição de novos repositórios
sudo apt update -y

### Download e instalaçao de programas externos
#mkdir "$DIRETORIO_DOWNLOADS"
#wget -c "$VARIAVEL_C_URL"       -P "$DIRETORIO_DOWNLOADS"
#wget -c "$VARIAVEL_C_URL"         -P "$DIRETORIO_DOWNLOADS"

### Instalando pacotes .deb baixados na sessão anterior
#sudo dpkg -i $DIRETORIO_DOWNLOADS/*.deb

### Instalar programas no apt
#for nome_do_programa in ${PROGRAMAS_PARA_INSTALAR[@]}; do
#  if ! dpkg -l | grep -q $nome_do_programa; then # Só instala se já não estiver instalado
#    apt install "$nome_do_programa" -y
#  else
#    echo "[INSTALADO] - $nome_do_programa"
#  fi
#done

###----------------------------- PÓS-INSTALAÇÃO -----------------------------###

## Finalização, atualização e limpeza##
sudo apt update && sudo apt dist-upgrade -y
flatpak update
sudo apt autoclean
sudo apt autoremove -y

# ----------------------------------- FIM ----------------------------------- #