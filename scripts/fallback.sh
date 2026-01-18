#!/bin/bash

LOG="/logs/fallback.log"
SLEEP=60

echo "[$(date)] Fallback system started" >> $LOG

while true; do
  GPU_UTIL=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits)

  if [ "$GPU_UTIL" -ge 5 ]; then
    # Vast trabajando
    if salad status | grep -q "Running"; then
      echo "[$(date)] Vast active, stopping Salad" >> $LOG
      salad stop
    fi
  else
    # GPU idle
    if ! salad status | grep -q "Running"; then
      echo "[$(date)] GPU idle, starting Salad" >> $LOG
      salad start
    fi
  fi

  sleep $SLEEP
done
