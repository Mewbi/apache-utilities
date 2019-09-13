# Apache Utilities
Os scripts existentes tem como função serem um facilitador de instalação do serviço Apache.
A ideia é utilizar scripts direto no terminal utilizando o comando cURL. Assim não é necessário fazer o download dos scripts na máquina.


## Apache Utilities


### [ Maneira de Usar ]  
```
curl -skL <link> | bash
```


#### [ Ajuda ] - help.sh 
Imprime o menu de ajuda, que contém as opções existentes que podem ser usadas.

Link: raw.githubusercontent.com/Mewbi/apache-utilities/master/help.sh
	  


#### [ Instalador ] - install.sh 
	Realiza a instalação do apache (utilizando-se do apt-get).

Link: raw.githubusercontent.com/Mewbi/apache-utilities/master/install.sh



#### [ Criar Site ] - create.sh
Cria uma página WEB no servidor.
Para seu funcionamento é necessário criar um arquivo txt com o nome "apache-utilities-create.txt" no diretório atual com as seguintes informações:

nome="nome-da-pasta-do-site"
modelo="[1-3]"

É possível escolher entre 3 modelos diferentes de site para ser usado como página padrão.

Link: raw.githubusercontent.com/Mewbi/apache-utilities/master/create.sh



#### [ Ativar Site ] - ative.sh
Ativa um site dos existentes no servidor.
Para seu funcionamento é necessário criar um arquivo txt com o nome "apache-utilities-ative.txt" no diretório atual com as seguintes informações:

ativar="nome-da-pasta-do-site"

Caso o arquivo não tenha sido criado, ou sua variável esteja vazia será impresso todos os sites existentes no servidor.

Link: raw.githubusercontent.com/Mewbi/apache-utilities/master/ative.sh



#### [ Desativar Site ] - disable.sh
Desativa um site dos existentes no servidor.
Para seu funcionamento é necessário criar um arquivo txt com o nome "apache-utilities-disable.txt" no diretório atual com as seguintes informações:

desativar="nome-da-pasta-do-site"

Caso o arquivo não tenha sido criado, ou sua variável esteja vazia será impresso todos os sites existentes no servidor.

Link: raw.githubusercontent.com/Mewbi/apache-utilities/master/disable.sh

