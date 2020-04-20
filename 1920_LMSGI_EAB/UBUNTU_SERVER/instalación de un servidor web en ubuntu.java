(ping)
sudo apt update
sudo apt install openssh-server
sudo apt install apache2

la pagaina web estan alamacenadas en el directorio /var/www/html

crear un usuario operadorweb
El usuario pertence al grupo www-data
Home del usuario /var/www/html
Contraseña paso3

//man add user (manual)

sudo adduser --ingroup www-data --no-create-home --home /var/www/html operadorweb

En el finchero/etc/passwd están todos los usuarios del sistema
Comando cat nos muestra el contenido de un fichero

sudo cat /etc/passwd | grep operadorweb
sudo cat /etc/group | grep www-data
Cambiar el propietario a la carpeta html
sudo chown -R operadorweb:www-data /var/www/html
ls -l /var/www

apagar la maquina
sudo poweroff

