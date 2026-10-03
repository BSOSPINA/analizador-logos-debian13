# Analizador de Logs del Sistema (Debian 13)

Este proyecto es un script de Bash diseñado para extraer, filtrar y formatear eventos críticos del archivo de registro principal del sistema (`/var/log/syslog`).

## Características
- Utiliza **grep** para buscar palabras clave como `error`, `fail` o `critical`.
- Utiliza **awk** para aislar columnas específicas (fecha, hora, origen del evento).
- Utiliza **sed** para resaltar visualmente la palabra clave con una etiqueta `[!!!] ERROR`.
- Genera automáticamente un reporte diario en la carpeta `reportes/`.

## Estructura del Proyecto
- `src/01_analizador-syslog.sh`: El código fuente principal del analizador.
- `test/test_analizador.sh`: Script de validación de sintaxis, existencia y permisos.
- `reportes/`: Directorio donde se guardan los archivos .txt generados.

## Instrucciones de Uso
1. Otorgar permisos de ejecución al script:
   ```bash
   chmod +x src/01_analizador-syslog.sh