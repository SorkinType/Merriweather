#!/bin/sh
source venv/bin/activate
set -e

cd sources

# echo "Generating Static fontmake OTFs fonts"
mkdir -p ../fonts/fm_otfs
fontmake -g Merriweather.glyphs -i -o otf --output-dir ../fonts/fm_otf/
fontmake -g Merriweather-Italic.glyphs -i -o ttf --output-dir ../fonts/fm_otf/


cd ..


