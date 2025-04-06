#!/bin/bash

# Obtém informações da janela ativa
ACTIVE_WINDOW=$(hyprctl activewindow -j 2>/dev/null)

# Verifica se há uma janela ativa
if [[ -z "$ACTIVE_WINDOW" || "$ACTIVE_WINDOW" == "null" ]]; then
    exit 1  # Sai se nenhuma janela estiver ativa
fi

# Obtém a classe da janela ativa
WINDOW_CLASS=$(echo "$ACTIVE_WINDOW" | jq -r ".class")

# Verifica se a classe foi obtida corretamente
if [[ -n "$WINDOW_CLASS" && "$WINDOW_CLASS" == "Steam" ]]; then
    xdotool getactivewindow windowunmap
else
    hyprctl dispatch killactive
fi

