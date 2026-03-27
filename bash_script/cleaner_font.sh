#!/usr/bin/env bash

set -e

FONTS_DIR="$HOME/.local/share/fonts"
FONTS_ZIP="$HOME/.local/share/fonts/zip"
TMP_DIR="/tmp/fonts_extract"

echo "📁 Préparation..."
mkdir -p "$FONTS_ZIP"


# Trouver tous les zip
mapfile -t ZIPS < <(find "$FONTS_DIR" -type f -name "*.zip")

if [ ${#ZIPS[@]} -eq 0 ]; then
  echo "❌ Aucun fichier ZIP trouvé."
  exit 1
fi

echo " Rangement des archives"
for zip in "${ZIPS[@]}"; do
  mv $zip $FONTS_ZIP
  #unzip -o "$zip" -d "$TMP_DIR"
done
echo "✅ clean terminée !"
