#!/usr/bin/env bash
set -euo pipefail

NOTIFICATION_JSON="${1:-{}}"

MSG="$(printf '%s' "$NOTIFICATION_JSON" | jq -r '.["last-assistant-message"] // ""' 2>/dev/null || true)"
MSG="${MSG//$'\n'/ }"
MSG="$(printf '%s' "$MSG" | tr -s '[:space:]' ' ' | sed 's/^ //; s/ $//')"

if [ -z "$MSG" ]; then
  MSG="Turn complete"
fi

MAX_LEN=50
if [ "${#MSG}" -gt "$MAX_LEN" ]; then
  MSG="${MSG:0:$MAX_LEN}..."
fi

# OSC 9: terminal notification (supported by iTerm2 and some other terminals).
printf '\e]9;Codex: %s\e\\' "$MSG" > /dev/tty 2>/dev/null || true
