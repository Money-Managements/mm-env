declare -A SERVICES
SERVICES=(
  [web]="web"
  [api]="api seed"
  [seed]="seed api"
  [sdk]="sdk"
  [test]="test api"
  [full]="web api seed"
)

KEY=$1

if [[ -v SERVICES["$KEY"] ]]; then
  SERVICE_NAME=${SERVICES[$KEY]}
  echo "Starting service: $SERVICE_NAME"
  docker compose up -d "$SERVICE_NAME"
else
  echo "Error: Invalid key '$KEY'."
  echo "Available keys:"
  for key in "${!SERVICES[@]}"; do
    echo "  - $key"
  done
  exit 1
fi