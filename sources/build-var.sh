#!/bin/sh
source venv/bin/activate
set -e

cd sources

echo "Generating VFs"
mkdir -p ../fonts/variable
fontmake -g Merriweather-Roman.glyphs -o variable --output-path ../fonts/variable/Merriweather-Roman-VF.ttf
fontmake -g Merriweather-Italic.glyphs -o variable --output-path ../fonts/variable/Merriweather-Italic-VF.ttf

#rm -rf master_ufo/ instance_ufo/
echo "Post processing"

vfs=$(ls ../fonts/variable/*.ttf)
for vf in $vfs
do
	gftools fix-dsig -f $vf;
	gftools fix-nonhinting $vf "$vf.fix";
	mv "$vf.fix" $vf;
	rm ${vf/".ttf"/"-backup-fonttools-prep-gasp.ttf"}

	ttx -f -x "MVAR" $vf; # Drop MVAR. Table has issue in DW
	rtrip=$(basename -s .ttf $vf)
	new_file=../fonts/variable/$rtrip.ttx;
	rm $vf;
	ttx $new_file
	rm ../fonts/variable/*.ttx

	python scripts/set-stat-table.py $vf

	# TODO: add instance name abbreviator python script
done

cd ..


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
