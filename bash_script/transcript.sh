#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <youtube_url>"
    exit 1
fi

URL="$1"

yt-dlp --skip-download --write-auto-subs --sub-lang en --convert-subs vtt "$URL"

FILE=$(ls *.en.vtt | tail -n 1)

if [ ! -f "$FILE" ]; then
    echo "❌ Sous-titres non trouvés."
    exit 1
fi

NEW_NAME=$(echo "$FILE" | awk -F'｜' '{
    gsub(/^[ \t]+|[ \t]+$/,"",$2);    # nettoyer espaces autour du champ 2
    gsub(/^[ \t]+|[ \t]+$/,"",$3);    # nettoyer espaces autour du champ 3
    split($3,a," ");
    printf "d%s-%s", a[2], $2
}')

sed -E '/^[0-9]+:[0-9]{2}:[0-9]{2}\.[0-9]{3} -->/d;/^[0-9]+$/d' "$FILE" > tmp.txt

awk 'BEGIN{RS=""; ORS="\n\n"} {gsub(/\n/, " "); print}' tmp.txt > tmp2.txt

awk '
{
  if ($0 ~ /^[[:space:]]*$/) {
    # ligne vide -> on regarde la suivante
    getline nextline
    if (nextline ~ /^[[:lower:]]/) {
      # si la suivante commence par minuscule -> fusion
      buf = buf " " nextline
    } else {
      # sinon -> flush du buffer + ligne vide
      if (buf != "") print buf
      print ""
      buf = nextline
    }
  } else {
    if (buf == "") buf = $0
    else buf = buf " " $0
  }
}
END {
  if (buf != "") print buf
}
' tmp2.txt > "$NEW_NAME".txt

rm -rf tmp.txt
rm -rf tmp2.txt

mv "$FILE" bkp_"$NEW_NAME".origin

echo "✅ Sous-titres nettoyés et sauvegardés sous : $NEW_NAME"
