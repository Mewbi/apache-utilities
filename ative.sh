#!/bin/bash

#Função que imprime sites existentes
_SITES(){
	echo -e "\nExistem os seguintes diretórios de sites no servidor\n\n"
	printf '%s\n' /var/www/* | cut -d/ -f 4
	echo -e "\nInsira um desses na variável 'ativar'"
}

#Verificando arquivos necessários
if [ -s "apache-utilities-ative.txt" ]; then
	source apache-utilities-ative.txt
	echo -e "\nArquivo "apache-utilities-ative" encontrado!\n"
else
	cat << END

	Erro!

Arquivo "apache-utilities-ative.txt" não encontrado ou vazio...
É necessário criar este arquivo no diretório atual contendo a seguinte informação:

ativar="nome-da-pasta-do-site"

END
	_SITES
	exit
fi

#Ativando o site
a2ensite ${ativar}.conf || { 
	echo -e "\nErro na ativação do site...\nVerifique se a variável 'ativar' possui um valor válido.\n"
	_SITES
	exit
}
systemctl restart apache2