#!/bin/bash

#Função que imprime sites existentes
_SITES(){
	echo -e "\nExistem os seguintes diretórios de sites no servidor\n\n"
	printf '%s\n' /var/www/* | cut -d/ -f 4
	echo -e "\nInsira um desses na variável 'desativar'"
}

#Verificando arquivos necessários
if [ -s "apache-utilities-disable.txt" ]; then
	source apache-utilities-disable.txt
	echo -e "\nArquivo "apache-utilities-disable" encontrado!\n"
else
	cat << END

	Erro!

Arquivo "apache-utilities-disable.txt" não encontrado ou vazio...
É necessário criar este arquivo no diretório atual contendo a seguinte informação:

desativar="nome-da-pasta-do-site"

END
	_SITES
	exit
fi

#Desativando o site
a2dissite ${desativar}.conf || { 
	echo -e "\nErro na desativação do site...\nVerifique se a variável 'desativar' possui um valor válido.\n"
	_SITES
	exit
}
systemctl restart apache2