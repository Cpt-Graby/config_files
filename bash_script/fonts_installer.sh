#!/usr/bin/env bash

set -e

BASE_DIR="$HOME/.local/share"
FONTS_DIR="$HOME/.local/share/fonts"
TMP_DIR="/tmp/fonts_extract"

echo "📁 Préparation..."
mkdir -p "$FONTS_DIR"
rm -rf "$TMP_DIR"
mkdir -p "$TMP_DIR"

echo "🔍 Recherche des fichiers ZIP dans $FONTS_DIR..."

# Trouver tous les zip
mapfile -t ZIPS < <(find "$FONTS_DIR" -type f -name "*.zip")

if [ ${#ZIPS[@]} -eq 0 ]; then
  echo "❌ Aucun fichier ZIP trouvé."
  exit 1
fi

echo "📦 Extraction des archives..."
for zip in "${ZIPS[@]}"; do
  echo "→ $zip"
  unzip -o "$zip" -d "$TMP_DIR"
done

echo "🔎 Installation des polices (.ttf / .otf)..."
find "$TMP_DIR" -type f \( -iname "*.ttf" -o -iname "*.otf" \) -exec cp -v {} "$FONTS_DIR" \;

echo "🧹 Nettoyage..."
rm -rf "$TMP_DIR"

echo "🔄 Mise à jour du cache des polices..."
fc-cache -fv

echo "✅ Installation terminée !"
echo "📍 Fonts installées dans : $FONTS_DIR"
