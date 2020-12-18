#!/bin/sh
source venv/bin/activate
set -e

cd sources

# echo "Generating Static fonts"
mkdir -p ../fonts/ttfs
fontmake -g Merriweather.glyphs -i -o ttf --output-dir ../fonts/ttfs/
fontmake -g Merriweather-Italic.glyphs -i -o ttf --output-dir ../fonts/ttfs/

echo "Post processing"

ttfs=$(ls ../fonts/ttfs/*.ttf)
echo $ttfs
for ttf in $ttfs
do
 	gftools fix-dsig -f $ttf;
	gftools fix-nonhinting $ttf "$ttf.fix";
	mv "$ttf.fix" $ttf;

     rm ${ttf/".ttf"/"-backup-fonttools-prep-gasp.ttf"}

#     # TODO: add instance name abbreviator python script
done

cd ..

# ============================================================================
# Autohinting ================================================================
# 
# statics=$(ls fonts/ttfs/*.ttf)
# echo hello
# for file in $statics; do 
#     echo "fix DSIG in " ${file}
#     gftools fix-dsig --autofix ${file}
# 
#     echo "TTFautohint " ${file}
#     # autohint with detailed info
#     hintedFile=${file/".ttf"/"-hinted.ttf"}
#     ttfautohint -I ${file} ${hintedFile} 
#     cp ${hintedFile} ${file}
#     rm -rf ${hintedFile}
# done


# ============================================================================
# Build woff2 fonts ==========================================================

# requires https://github.com/bramstein/homebrew-webfonttools

rm -rf fonts/woff2

ttfs=$(ls fonts/*/*.ttf)
for ttf in $ttfs; do
    woff2_compress $ttf
done

mkdir -p fonts/woff2
woff2s=$(ls fonts/*/*.woff2)
for woff2 in $woff2s; do
    mv $woff2 fonts/woff2/$(basename $woff2)
done


# ============================================================================
# Build woff fonts ==========================================================

# requires https://github.com/bramstein/homebrew-webfonttools

# rm -rf fonts/woff

# ttfs=$(ls fonts/*/*.ttf)
# for ttf in $ttfs; do
#     sfnt2woff-zopfli $ttf
# done

# mkdir -p fonts/woff
# woffs=$(ls fonts/*/*.woff)
# for woff in $woffs; do
#     mv $woff fonts/woff/$(basename $woff)
# done

# ============================================================================
# Build CFF OTF fonts ==========================================================



cd ..


