#!/bin/bash

#Verificando arquivos necessários
if [ -s "apache-utilities-create.txt" ]; then
	source apache-utilities-create
	echo -e "\nArquivo "apache-utilities-create" encontrado!\n"
else
	cat << END

	Erro!

Arquivo "apache-utilities-create.txt" não encontrado ou vazio...
É necessário criar este arquivo no diretório atual contendo as seguintes informações:

nome="nome-da-pasta-do-site"
modelo="[1-3]"

END
	exit
fi

#Criando local para armazenamento do site
mkdir -p /var/www/$nome/public_html
chown -R $USER:$USER /var/www/$nome/public_html
chmod -R 755 /var/www

#Inserindo página HTML
case $modelo in
	1)
	wget raw.githubusercontent.com/Mewbi/apache-utilities/master/models/index.html
	mv index.html  /var/www/$nome/public_html
	;;

	2)
	echo
	;;

	3)
	echo
	;;

	*)
	echo
	;;
esac


#Configurando o site
cp /etc/apache2/sites-available/000-default.conf /etc/apache2/sites-available/$nome.conf
echo "<VirtualHost *:80>
ServerAdmin admin@$nome
ServerName $nome
DocumentRoot /var/www/$nome/public_html
ErrorLog ${APACHE_LOG_DIR}/error.log
CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>" > /etc/apache2/sites-available/$nome.conf
a2ensite $nome.conf
a2dissite 000-default.conf
systemctl restart apache2
