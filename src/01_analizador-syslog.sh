#!/bin/bash

# 1. Configuración de variables de entorno
ARCHIVO_LOG="/var/log/syslog"
FECHA=$(date +"%Y-%m-%d")
ARCHIVO_REPORTE="./reportes/reporte_critico_${FECHA}.txt"

# 2. Control de acceso: Verificar permisos de administrador
if [ "$(id -u)" -ne 0 ]; then
  echo "Error: Ejecútalo con sudo."
  exit 1
fi

echo "Analizando $ARCHIVO_LOG..."

# 3. Inicialización del archivo de reporte
echo "=== REPORTE DE EVENTOS CRÍTICOS - FECHA: $FECHA ===" > "$ARCHIVO_REPORTE"
echo "======================================================" >> "$ARCHIVO_REPORTE"

# 4. Pipeline de procesamiento: Filtra errores (grep), estructura columnas (awk) y resalta etiquetas (sed)
grep -iE "error|fail|critical" "$ARCHIVO_LOG" | \
awk '{ print "-> [" $1, $2, $3 "] Detalle del problema: " $0 }' | \
sed 's/error/[!!!] ERROR/Ig' >> "$ARCHIVO_REPORTE"

# 5. Cierre
echo "======================================================" >> "$ARCHIVO_REPORTE"
echo "¡Reporte generado en $ARCHIVO_REPORTE!"