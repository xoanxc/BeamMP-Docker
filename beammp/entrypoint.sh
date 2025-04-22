#!/bin/bash

CONFIG_FILE="/beammp/ServerConfig.toml"

# Crear configuración si no existe
if [ ! -f "$CONFIG_FILE" ]; then
  echo "Generando ServerConfig.toml..."

  cat <<EOF > "$CONFIG_FILE"
Key = "${SERVER_KEY}"
Port = 30814
MaxCars = ${MAX_PLAYERS:-10}
Map = "${MAP:-/levels/gridmap_v2/info.json}"
AuthKey = ""
ResourceFolder = "/beammp/Resources"
EOF
else
  echo "Usando configuración existente."
fi

mkdir -p /beammp/Resources

echo "Iniciando BeamMP Server..."
exec ./BeamMP-Server.x86_64
