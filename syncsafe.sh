#!/bin/bash

# syncsafe.sh
# Script interactivo para copia o movimiento seguro de carpetas usando rsync


###############################################################################################################################################################
# AJUSTES DE PERSONALIZACIÓN DE LA SALIDA
###############################################################################################################################################################

# Estilos de texto
BOLD="\033[1m"
UNDERLINE="\033[4m"
ITALIC="\033[3m"

# Color de reinicio
RESET="\033[0m"

# Colores para mensajes
GREY="\033[38;5;245m"
CYAN="\033[0;36m"
YELLOW="\033[38;5;226m"
GREEN="\033[0;32m"
LIME="\033[38;5;118m"
ORANGE="\033[38;5;208m"
RED="\033[0;31m"

# Colores para títulos
BLUE="\033[0;34m"
TEAL="\033[38;5;44m"
PURPLE="\033[38;5;57m"
MAGENTA="\033[38;5;129m"
PINK="\033[38;5;218m"

# Funciones de estilo
note() { echo -e "${GREY}${ITALIC}$*${RESET}"; }
info() { echo -e "${CYAN}$*${RESET}"; }
important() { echo -e "${YELLOW}$*${RESET}"; }
success() { echo -e "${GREEN}$*${RESET}"; }
success_b() { echo -e "${LIME}$*${RESET}"; }
warn() { echo -e "${ORANGE}$*${RESET}"; }
error() { echo -e "${RED}$*${RESET}"; }
title1() { echo -e "${BLUE}${BOLD}$*${RESET}"; }
title2() { echo -e "${TEAL}${BOLD}$*${RESET}"; }
title3() { echo -e "${PURPLE}${BOLD}$*${RESET}"; }
title4() { echo -e "${MAGENTA}${BOLD}$*${RESET}"; }
title5() { echo -e "${PINK}${BOLD}$*${RESET}"; }




###############################################################################################################################################################
# CODIGO PRINCIPAL
###############################################################################################################################################################

echo ""
title1 "#########################################################################################################################################"
title1 "SCRIPT PARA COPIAR O MOVER UNA CARPETA DE UN LUGAR A OTRO EN EL SISTEMA DE FORMA SEGURA E INTERACTIVA"
title1 "#########################################################################################################################################"
echo ""

# Proporcionar información
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
title2 "💬 Proporcione las rutas de las carpetas:"
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
echo ""

# Pedir carpeta origen
read -rp "---> Ruta COMPLETA de la carpeta de ORIGEN que quiere COPIAR/MOVER: " ORIGEN

# Limpiar comillas iniciales/finales si existen
ORIGEN="${ORIGEN%\"}"   # quitar " al final
ORIGEN="${ORIGEN#\"}"   # quitar " al inicio
ORIGEN="${ORIGEN%\'}"   # quitar ' al final
ORIGEN="${ORIGEN#\'}"   # quitar ' al inicio

# Comprobar origen
if [ ! -d "$ORIGEN" ]; then
  echo ""
  error "❌ Error: la carpeta de origen no existe."
  echo ""
  exit 1
fi

# Pedir carpeta destino
read -rp "---> Ruta COMPLETA de la carpeta de DESTINO donde quiere COPIAR/MOVER: " DESTINO

# Limpiar comillas iniciales/finales si existen
DESTINO="${DESTINO%\"}"
DESTINO="${DESTINO#\"}"
DESTINO="${DESTINO%\'}"
DESTINO="${DESTINO#\'}"

# Comprobar destino
if [ ! -d "$DESTINO" ]; then
  echo ""
  error "❌ Error: la carpeta de destino no existe."
  echo ""
  exit 1
fi

# Información proporcionada
echo ""
title3 "📄 Información proporcionada:"
title3 "========================================================================================="
important "📂 Carpeta de origen: $ORIGEN"
important "📁 Carpeta de destino: $DESTINO"


# Preguntar acción: copiar o mover
echo ""
echo ""
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
title2 "📦 ¿Qué acción quiere realizar?"
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
echo ""
echo "1) COPIAR (copiar y pegar, mantener archivos en el origen)"
echo "2) MOVER (cortar y pegar, eliminar archivos en el origen después)"
read -rp "---> Opción (1/2): " OPCION

if [[ "$OPCION" != "1" && "$OPCION" != "2" ]]; then
  echo ""
  error "❌ Opción no válida. Operación cancelada."
  echo ""
  exit 1
fi

ACCION=""
if [[ "$OPCION" == "1" ]]; then
  ACCION="copiar"
else
  ACCION="mover"
fi

# Información proporcionada
echo ""
title3 "📄 Información proporcionada:"
title3 "========================================================================================="
important "🪄 Ha elegido: $ACCION"


# Confirmación final
echo ""
echo ""
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
title2 "🤔 ¿Está seguro de que quiere continuar?"
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
echo ""
echo "s) Sí, quiero continuar."
echo "n) No, quiero cancelar."
read -rp "---> (s/n): " CONFIRMAR

if [[ "$CONFIRMAR" != "s" && "$CONFIRMAR" != "S" ]]; then
  echo ""
  error "❌ Operación cancelada."
  echo "🚪 Cerrando el programa..."
  echo "👋 Hasta pronto!"
  echo ""
  exit 0
fi

# Información proporcionada
echo ""
title3 "📄 Información proporcionada:"
title3 "========================================================================================="
if [[ "$CONFIRMAR" == "s" || "$CONFIRMAR" == "S" ]]; then
  important "🪄 Ha elegido: Confirmar y continuar con el proceso de $ACCION"
fi


# Inicio del proceso de copia/movido
echo ""
echo ""
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
title2 "🚀 Iniciando el proceso de $ACCION archivos..."
title2 "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
echo ""

if [[ "$OPCION" == "1" ]]; then
    # Solo copiar
    info "📋 Copiando archivos..."
    echo ""
    rsync -avh --progress "$ORIGEN" "$DESTINO/"
else
    # Mover: copiar primero y luego borrar origen si todo salió bien
    info "📋 Copiando archivos..."
    echo ""
    rsync -avh --progress "$ORIGEN" "$DESTINO/"
    if [ $? -eq 0 ]; then
        echo ""
        info "🗑️ Copia completada, eliminando archivos de origen..."
        rm -rf "$ORIGEN"
    else
        echo ""
        error "❌ Hubo un error durante la copia. No se eliminarán los archivos originales."
    fi
fi


# Fin del proceso
echo ""
echo ""
success_b "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
success_b "✅ Proceso de $ACCION finalizado."
success_b "≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠≠"
echo ""
success "🚪 Cerrando el programa..."
success "👋 Hasta pronto!"
echo ""
