#!/bin/bash

echo "Iniciando pruebas del analizador de logs..."

# 1. Verificar si el script principal existe
if [ -f "src/01_analizador-syslog.sh" ]; then
    echo "[OK] El script principal existe."
else
    echo "[ERROR] No se encuentra src/01_analizador-syslog.sh"
    exit 1
fi

# 2. Verificar permisos de ejecución
if [ -x "src/01_analizador-syslog.sh" ]; then
    echo "[OK] El script tiene permisos de ejecución."
else
    echo "[ERROR] El script NO tiene permisos de ejecución. Usa chmod +x"
    exit 1
fi

# 3. Verificar si el directorio de reportes existe
if [ -d "reportes" ]; then
    echo "[OK] El directorio de reportes existe."
else
    echo "[WARNING] El directorio de reportes no existe, se creará al ejecutar."
fi

echo "Todas las validaciones completadas."