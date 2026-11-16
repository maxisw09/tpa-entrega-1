#!/bin/sh
echo "Iniciando Cron Worker interno..."

# Bucle infinito
while true; do
  # Espera 86400 segundos (24 horas)
  sleep 86400

  echo "Disparando tareas programadas..."
  # Ejecutar las llamadas POST hacia tu propia API de Javalin
  curl -X POST "${DONACIONES_URL}/api/internal/cron/matchmaking" -H "X-API-KEY: ${CRON_API_KEY}"
  curl -X POST "${DONACIONES_URL}/api/internal/cron/inactividad" -H "X-API-KEY: ${CRON_API_KEY}"
  echo "Tareas disparadas."
done