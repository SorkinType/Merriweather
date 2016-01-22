Open the UFO in Glyphs v2.3b and Export to your Desktop.

Choose to remove overlaps, do not autohint, and use TrueType.

Then hint the fonts with ttfautohint v1.4.1:

    mkdir UNHINTED;
    mv ~/Desktop/Merriweather-*.ttf UNHINTED/;
    for i in `ls -1 UNHINTED/*ttf`; do \
      echo $i; ttfautohint -l 6 -r 50 \
      -G 0 -x 11 -H 220 -D latn -f none \
      -w "" -X "" -I \
      $i $i-ta;
    done;
    mv UNHINTED/*-ta . ; 
    rename s/ttf-ta/ttf/g *;

Then fixup the TTX files by hand, correct the NAME table.

    ttx *ttf;
    rm *ttf;
    # fix them
    ttx *ttx;
    rm *ttx;
