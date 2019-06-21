# Kan
Esta herramienta tiene el fin de automatizar el reconocimiento de una plataforma web con herramientas clásicas del entorno de Kali Linux, Optimizando tiempos que son preciso al momento de llevar a cabo un escaneo de un sitio web. Esta genera la opción de la instalación automática de sus componentes y la capacidad de almacenar las pruebas realizadas en un objetivo.

Las herramientas utilizadas son las siguientes:

Nmap https://github.com/nmap/nmap
CheckWeb https://github.com/SVelizDonoso/checkweb
Testssl https://github.com/drwetter/testssl.sh
Nikto https://cirt.net/Nikto2
Wpscan https://github.com/wpscanteam/wpscan
Dirb https://github.com/v0re/dirb


Kan es una herramienta de código abierto, con el cual fue creado para uso exclusivo para fines de estudio, El creador de esta herramienta no se hace responsable por el la utilización de la herramienta “Kan” creada por “R1314”. 

Dentro de Pentest, existen 3 funciones:

  Wordpress:
Para el correcto uso de la herramienta, se recomienda seleccionar Wordpress para dicha plataforma, el cual se utiliza WPSCAN, CheckWeb y Nmap.

  Webservice:
Esta función utiliza solo Nmap y CheckWeb, esta corresponde para todo tipo de Sitio Web.

  Hard:
Esta utiliza la herramienta de Nikto + Dirb para una búsqueda exhaustiva.


Instalación

git clone https://github.com/R1314/Kan

chmod +x kan.sh
./kan.sh
Opción 2


Se crearán carpetas y descargan archivos en la siguiente direccion 

/root/Kan	



Requerimientos:

Kali Linux

En caso de no tener Kali Linux, este debe tener instalado las siguientes herramientas: 

Nmap https://github.com/nmap/nmap
Testssl https://github.com/drwetter/testssl.sh
Nikto https://cirt.net/Nikto2
Wpscan https://github.com/wpscanteam/wpscan
Dirb https://github.com/v0re/dirb

Versión 1.1
