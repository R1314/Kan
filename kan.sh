#!/bin/bash
echo "Loading..."
sleep 1
echo "Loading...."
sleep 1
clear


function main_menu 
{
clear
option=0
until [ "$option" = "5" ]; do
echo ""
echo "   -----------  Easy Pentest  ------------ "
echo ""
echo "	██░  ██░ ████░     ████░ ██░"
echo "	██░ ██░  ██░██░    ██░██░██░"
echo "	████░    ██░ ██░   ██░ ████░"
echo "	██░ ██░  ███████░  ██░  ███░"
echo "	██░  ██░ ██░   ██░ ██░   ██░"
echo ""
echo "Powered By R1314"
echo ""
echo "Warning: Usalo bajo tu propio riesgo."
echo "No nos hacemos responsable del mal uso de esta herramienta."
echo ""
echo " Elige una función: "
echo ""
echo "  1.) Pentest"
echo "  2.) Instalación"
echo "  3.) Quit"
echo ""
echo -n "Select: "
read option
echo ""
case $option in
    1 ) dashBoard;; 
    2 ) prep;;
    3 ) exit;;
    * ) tput setf 3;echo "Please enter 1,2 or 3";tput setf 3; 
esac
done
}

function prep
{

cd /root
mkdir Kan
cd Kan
mkdir reporte
git clone https://github.com/SVelizDonoso/checkweb.git
sleep 5
cd checkweb
pip install -r requirements.txt
sleep 3
cd ..
echo "CheckWeb..."
sleep 0.5
echo "CheckWeb......"
sleep 0.5
echo "CheckWeb......[Done]"
sleep 1

}

#principal
function dashBoard
{
option=0
clear
until [ "$option" = "3" ]; do
echo "  Pentest"
echo ""
echo "Recuerda la Instalación primero"
echo "Asegurate de que no existan archivos en reporte"
echo ""
echo "¿Desea almacenar las pruebas?"
echo ""
echo "  1.) Si"
echo "  2.) No"
echo "  4.) Volver"
echo ""
echo -n "Ingresar: "
read option
echo ""
case $option in
    1 ) sPentest;;
    2 ) nPentest;;
    3 ) main_menu;;
    * ) tput setf 3;echo "Please enter 1,2 o 3";tput setf 3; 
esac
done
}

function sPentest
{
option=0
clear
until [ "$option" = "4" ]; do
echo "Pentest - Preliminar"
echo ""
echo "Recuerda la Instalación primero"
echo "Asegurate de que no existan archivos en reporte"
echo ""
echo "Selecciona el tipo de WebService"
echo ""
echo "  1.) WordPress"
echo "  2.) Webservice"
echo "  3.) Heavy Scan"
echo "  4.) Volver"
echo ""
echo -n "Ingresar: "
read option
echo ""
case $option in
    1 ) swordPress;;
    2 ) swebserv;;
    3 ) sheavy;;
    4 ) main_menu;;
    * ) tput setf 4;echo "Please enter 1,2,3 o 4";tput setf 4; 
esac
done
}

function swordPress
{
echo "WordPress"
echo ""
echo "Selecciona un target sin https:// o http:// "
echo ""
echo -n "Target: "
read target
echo ""
echo "Wpscan Start."
cd /root/Kan/reporte
wpscan --url $target --enumerate --output wpscan.txt
cd /root/Kan
echo "Wpscan Start.."
sleep 3
echo "Wpscan Done..."
echo ""
echo "Nmap Start."
nmap --script=vuln $target >> /root/Kan/reporte/nmapVuln.txt 
nmap -sV $target >> /root/Kan/reporte/nmapPuertos.txt
echo ""
echo "Nmap Start.."
sleep 2
echo "Nmap Done..."
sleep 2
echo "CheckWeb Start."
cd /root/Kan/checkweb
echo "CheckWeb Start.."
python checkweb.py -u https://$target -sec -tec >> /root/Kan/reporte/checkweb.txt
echo "CheckWeb Done..."
sleep 4
cd /root/Kan
nmap --script=method $target >> /root/Kan/reporte/method.txt
cd /root/Kan/reporte
echo "SSLTEST Start"
#testssl --log $target
nmap --script=ssl-enum-ciphers $target >> /root/Kan/reporte/method.txt
echo "SSLTEST Start.."
sleep 2
cd /root/Kan
echo "SSLTEST DONE..."
echo "Listo ----"
echo ""
option=0
until [ "$option" = "4" ]; do
echo "Pentest - Preliminar"
echo ""
echo "Recuerda la Instalación primero"
echo ""
echo "Selecciona el tipo de WebService"
echo ""
echo "  1.) WordPress"
echo "  2.) Webservice"
echo "  3.) Heavy Scan"
echo "  4.) Volver"
echo ""
echo -n "Ingresar: "
read option
echo ""
case $option in
    1 ) swordPress;;
    2 ) swebserv;;
    3 ) sheavy;;
    4 ) main_menu;;
    * ) tput setf 4;echo "Please enter 1,2,3 o 4";tput setf 4; 
esac
done
}

function swebserv
{
clear
echo "WebService"
echo ""
echo "Selecciona un target sin https:// o http:// "
echo ""
echo -n "Target: "
read target
echo "nmap Start."
nmap --script=vuln $target >> /root/Kan/reporte/nmapVuln.txt 
clear
echo "nmap Start.."
nmap -sV $target >> /root/Kan/reporte/nmapPuertos.txt
clear
echo "nmap Start..."
sleep 2
echo "checkweb Start."
cd /root/Kan/checkweb
python checkweb.py -u https://$target -sec -tec >> /root/Kan/reporte/checkweb.txt
clear
echo "checkweb Start.."
sleep 1
clear
echo "checkweb Start..."
sleep 4
cd /root/Kan
clear
echo "checkweb Done"
nmap --script=method $target >> /root/Kan/reporte/method.txt
sleep 2
echo "TestSSL..."
testssl --log $target
sleep 4
echo "Listo ----"
echo ""
option=0
until [ "$option" = "4" ]; do
echo "Pentest - Preliminar"
echo ""
echo "Recuerda la Instalación primero"
echo ""
echo "Selecciona el tipo de WebService"
echo ""
echo "  1.) WordPress"
echo "  2.) Webservice"
echo "  3.) Heavy Scan"
echo "  4.) Volver"
echo ""
echo -n "Ingresar: "
read option
echo ""
case $option in
    1 ) swordPress;;
    2 ) swebserv;;
    3 ) sheavy;;
    4 ) main_menu;;
    * ) tput setf 4;echo "Please enter 1,2,3 o 4";tput setf 4; 
esac
done
}

function sheavy
{
clear
echo "Heavy Scan"
echo ""
echo "Selecciona un target sin https:// o http:// "
echo ""
echo -n "Target: "
read target
echo "Nikto Start"
nikto -host $target >> /root/Kan/reporte/nikto.txt
echo "Nikto Ready"
sleep 4
echo ""
echo "Dirbusting Start"
dirb https://$target >> /root/Kan/reporte/dirb.txt
echo "Dirbusting Done"
echo ""
echo "Pentest preliminar Listo"
}

#noFile--------------------

function nPentest
{
option=0
clear
until [ "$option" = "4" ]; do
echo "Pentest - Preliminar"
echo ""
echo "Recuerda la Instalación primero"
echo "Asegurate de que no existan archivos en reporte"
echo ""
echo "Selecciona el tipo de WebService"
echo ""
echo "  1.) WordPress"
echo "  2.) Webservice"
echo "  3.) Heavy Scan"
echo "  4.) Volver"
echo ""
echo -n "Ingresar: "
read option
echo ""
case $option in
    1 ) nwordPress;;
    2 ) nwebserv;;
    3 ) nheavy;;
    4 ) main_menu;;
    * ) tput setf 4;echo "Please enter 1,2,3 o 4";tput setf 4; 
esac
done
}

function swordPress
{
echo "WordPress"
echo ""
echo "Selecciona un target sin https:// o http:// "
echo ""
echo -n "Target: "
read target
echo ""
echo "Wpscan Start."
cd /root/Kan/reporte
wpscan --url $target --enumerate
cd /root/Kan
echo "Wpscan Start.."
sleep 3
echo "Wpscan Done..."
echo ""
echo "Nmap Start."
nmap --script=vuln $target
nmap -sV $target
echo ""
echo "Nmap Start.."
sleep 2
echo "Nmap Done..."
sleep 2
echo "CheckWeb Start."
cd /root/Kan/checkweb
echo "CheckWeb Start.."
python checkweb.py -u https://$target -sec -tec
echo "CheckWeb Done..."
sleep 4
cd /root/Kan
nmap --script=method $target
cd /root/Kan/reporte
echo "SSLTEST Start"
testssl $target
#nmap --script=ssl-enum-ciphers $target >> /root/Kan/reporte/method.txt
echo "SSLTEST Start.."
sleep 2
cd /root/Kan
echo "SSLTEST DONE..."
echo "Listo ----"
echo ""
option=0
until [ "$option" = "4" ]; do
echo "Pentest - Preliminar"
echo ""
echo "Recuerda la Instalación primero"
echo ""
echo "Selecciona el tipo de WebService"
echo ""
echo "  1.) WordPress"
echo "  2.) Webservice"
echo "  3.) Heavy Scan"
echo "  4.) Volver"
echo ""
echo -n "Ingresar: "
read option
echo ""
case $option in
    1 ) nwordPress;;
    2 ) nwebserv;;
    3 ) nheavy;;
    4 ) main_menu;;
    * ) tput setf 4;echo "Please enter 1,2,3 o 4";tput setf 4; 
esac
done
}

function nwebserv
{
clear
echo "WebService"
echo ""
echo "Selecciona un target sin https:// o http:// "
echo ""
echo -n "Target: "
read target
echo "nmap Start."
nmap --script=vuln $target
clear
echo "nmap Start.."
nmap -sV $target
clear
echo "nmap Start..."
sleep 2
echo "checkweb Start."
cd /root/Kan/checkweb
python checkweb.py -u https://$target -sec -tec 
clear
echo "checkweb Start.."
sleep 1
clear
echo "checkweb Start..."
sleep 4
cd /root/Kan
clear
echo "checkweb Done"
nmap --script=method $target 
sleep 2
echo "TestSSL..."
testssl $target
sleep 4
echo "Listo ----"
echo ""
option=0
until [ "$option" = "4" ]; do
echo "Pentest - Preliminar"
echo ""
echo "Recuerda la Instalación primero"
echo ""
echo "Selecciona el tipo de WebService"
echo ""
echo "  1.) WordPress"
echo "  2.) Webservice"
echo "  3.) Heavy Scan"
echo "  4.) Volver"
echo ""
echo -n "Ingresar: "
read option
echo ""
case $option in
    1 ) nwordPress;;
    2 ) nwebserv;;
    3 ) nheavy;;
    4 ) main_menu;;
    * ) tput setf 4;echo "Please enter 1,2,3 o 4";tput setf 4; 
esac
done
}

function nheavy
{
clear
echo "Heavy Scan"
echo ""
echo "Selecciona un target sin https:// o http:// "
echo ""
echo -n "Target: "
read target
echo "Nikto Start"
nikto -host $target
echo "Nikto Ready"
sleep 4
echo ""
echo "Dirbusting Start"
dirb https://$target
echo "Dirbusting Done"
echo ""
echo "Pentest preliminar Listo"
}

    

main_menu
