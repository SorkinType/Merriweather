#!/bin/sh
#source venv/bin/activate
set -e

#cd sources

echo "Generating Static fonts"
mkdir -p ../fonts/ttfs
#fontmake -g Merriweather-Roman.glyphs -i -o ttf --output-dir ../fonts/ttfs/
#fontmake -g Merriweather-Italic.glyphs -i -o ttf --output-dir ../fonts/ttfs/

echo "Generating VFs"
mkdir -p ../fonts/variable
fontmake -g Merriweather-Roman.glyphs -o variable --output-path ../fonts/variable/Merriweather-Roman-VF.ttf
fontmake -g Merriweather-Italic.glyphs -o variable --output-path ../fonts/variable/Merriweather-Italic-VF.ttf

rm -rf master_ufo/ instance_ufo/
echo "Post processing"


ttfs=$(ls ../fonts/ttfs/*.ttf)
echo $ttfs
for ttf in $ttfs
do
	gftools fix-dsig -f $ttf;
	gftools fix-nonhinting $ttf "$ttf.fix";
	mv "$ttf.fix" $ttf;
done
rm ../fonts/ttfs/*backup*.ttf

vfs=$(ls ../fonts/variable/*.ttf)
for vf in $vfs
do
	gftools fix-dsig -f $vf;
	gftools fix-nonhinting $vf "$vf.fix";
	mv "$vf.fix" $vf;
	ttx -f -x "MVAR" $vf; # Drop MVAR. Table has issue in DW
	rtrip=$(basename -s .ttf $vf)
	new_file=../fonts/variable/$rtrip.ttx;
	rm $vf;
	ttx $new_file
	rm ../fonts/variable/*.ttx
done
rm ../fonts/variable/*backup*.ttf

gftools fix-vf-meta $vfs;
for vf in $vfs
do
	mv "$vf.fix" $vf;
done



cd ..

# ============================================================================
# Autohinting ================================================================

statics=$(ls fonts/ttfs/*.ttf)
echo hello
for file in $statics; do 
    echo "fix DSIG in " ${file}
    gftools fix-dsig --autofix ${file}

    echo "TTFautohint " ${file}
    # autohint with detailed info
    hintedFile=${file/".ttf"/"-hinted.ttf"}
    ttfautohint -I ${file} ${hintedFile} 
    cp ${hintedFile} ${file}
    rm -rf ${hintedFile}
done


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

rm -rf fonts/woff

ttfs=$(ls fonts/*/*.ttf)
for ttf in $ttfs; do
    sfnt2woff-zopfli $ttf
done

mkdir -p fonts/woff
woffs=$(ls fonts/*/*.woff)
for woff in $woffs; do
    mv $woff fonts/woff/$(basename $woff)
done
