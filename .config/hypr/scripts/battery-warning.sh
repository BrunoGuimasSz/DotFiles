#!/bin/bash

# Configuração
LOW_BATTERY_LEVEL=15
CRITICAL_BATTERY_LEVEL=5
NOTIFY_CMD="notify-send -u critical -t 10000 'Low battery' 'Connect the charger'"

# Identifica o dispositivo de bateria
BATTERY=$(upower -e | grep BAT)

# Obtém a porcentagem da bateria
PERCENTAGE=$(upower -i $BATTERY | grep -E "percentage" | awk '{print $2}' | sed 's/%//')

# Verifica se está descarregando
STATE=$(upower -i $BATTERY | grep -E "state" | awk '{print $2}')

if [[ "$STATE" == "discharging" ]]; then
    if (( PERCENTAGE <= CRITICAL_BATTERY_LEVEL )); then
        $NOTIFY_CMD "Bateria crítica: ${PERCENTAGE}%"
    elif (( PERCENTAGE <= LOW_BATTERY_LEVEL )); then
        $NOTIFY_CMD "Bateria baixa: ${PERCENTAGE}%"
    fi
fi

