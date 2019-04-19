# OFFICIAL Merriweather Repo

This repo is where updates to this project will be found

The previous repo here https://github.com/EbenSorkin/Merriweather will be left intact but is now inactive.

The next steps for this project will be to add to the capbility of the variable fonts along optical size and width axes. Equivalent static fonts will also be made.

Issues from the previous repo will be ported over when I can figure out how to do it.

# Merriweather FONTLOG

This file provides detailed information on Merriweather font Software.
This information should be distributed along with the Merriweather fonts and any derivative works.

Merriweather is useful for creating long texts for books or articles, headlines and captions.

## Basic Font Information

Merriweather offers a Renaissance warmth while using proportions which are space-saving. 
It is suitable for editorial design, news and other kinds of space sensitive typography.
Merriweather is an evolving project and will be updated.
As of now there are 8 styles (Light, Regular, Bold, Black, Light Italic, Italic, Bold Italic, Black Italic.)

There is also [Merriweather Sans](https://fonts.google.com/specimen/Merriweather+Sans), a sans-serif version which closely harmonizes with the weights and styles of this serif family.

Variable Font versions of this family are now in beta ( being tested ).

Merriweather is actively developed and is improved upon periodically. 
For more information and to stay updated, see Eben Sorkin's blog and Flickr, and follow the Merriweather Twitter microblog:

* http://ebensorkin.wordpress.com
* http://www.flickr.com/photos/55990250@N02/
* http://twitter.com/MerriweatherFnt

Merriweather is a Unicode typeface family that supports languages that use the Latin script and its variants, and could be expanded to support other scripts.

More specifically, this release supports the following Unicode ranges: Latin-1, Latin-2, Cyrillic, Turkish, Windows Baltic, Macintosh Character Set

## Contributing

There are 2 source files, one for Romans and one of Italics, in the [GlyphsApp](https://www.glyphsapp.com) format. 

To contribute to the project, file issues at <https://github.com/EbenSorkin/Merriweather> or contact Eben Sorkin directly at <sorkineben@gmail.com>

## Build Process

The sources can be built with FontMake, but I've put together some specific build scripts to pass the fonts through some steps that fix metadata issues.

### Step 1: Set up the project locally

The build process requires you to open up a terminal and navigate to this project's directory. Open a terminal, then navigate to the a directory (folder) for type projects, and git clone this repo.

```bash
cd path/to/type_repos_directory

# then
git clone https://github.com/SorkinType/Merriweather.git
```

You should use a Python virtual environment to build this project. If you've never set up a virtual environment before, [read more about it in this guide](https://packaging.python.org/tutorials/installing-packages/#creating-virtual-environments).

You can set up a Python 3 virtual environment with:

```bash
python3 -m venv ./venv
```

Here, `python3 -m venv` calls the virtual-environment-making module, then the `./venv` gives it a path to setup a virtual environment in (you could give a different path, but this is a conventional name). 

Before you install dependencies or run the build, you need to activate the virtual environment with:

```bash
source venv/bin/activate
```

If you wish exit out of the virtual environment, you can use the command `deactivate` (just remember to start it up again if you come back). You can also simply close the terminal session.

Once you've activated the venv, install requirements by pointing pip to the `requirements.txt` file:

```bash
pip install -r requirements.txt
```

**Setting up for woff & woff2 conversion**

The build script also converts outputs to web-ready formats, `woff` & `woff2`.

To enable this, use Homebrew ([install it from here](https://brew.sh/) if you haven't already) to get tools from [bramstein/homebrew-webfonttools](https://github.com/bramstein/homebrew-webfonttools):

```
brew install woff2
brew install sfnt2woff-zopfli
```

### Step 2: Give permissions to build scripts

The first time you run the build, you will need to give run permissions to the build scripts.

On the command line, navigate to the project folder (`cd Encode-Sans`), and then give permissions to the shell scripts with:

```bash
chmod +x sources/build.sh
```

Using `chmod +x` gives shell scripts execute permissions. In general, before you do this for shell scripts, you should probably take a look through their contents, to be sure they aren't doing anything you don't want them to do. The ones in this repo simply build from the GlyphsApp sources and apply various fixes to the results.

### Step 3: Run the build scripts!

Now, run the build script by entering its relative path in your terminal:

```bash
sources/build.sh
```

If you've set up your dependencies correctly, it should build and place fonts into the `/fonts` sub-directory of the project.

## ChangeLog

### 5 April 2019 (Eben Sorkin) Merriweather v2.005 - Ready to use! :-) 
* changed UPM to 2000
* Small caps are added
* "Zero" 0 Value kern pair eliminated
* Kerning is added for nboth Latin and Cyrillic
* Some respacing (losening ) of the Cyrillic, especially the italic.
* Further rationalizing of the kern groups
* Minor shape corrections for color and consistency 
* Added cursor Carat data diacritics in the italic
* Added family alignment zones to font level settings
* Added upper blue zone for small caps

### 2 Feb 2019 (Eben Sorkin) Merriweather v2.004

*  Primary respacing of Latin in both Roman and Italic from n, and o and H and O outward. The color in text is much improved.
*  Changed the space glyph width ( yes really! ) for better color and more consistency in apparent approach across weights
*  Adding a significant amout of kerning to both Roman and Italic.
*  Changes to some glyph shapes for increased eveness in color and design consistency. Glyphs include : J,K,M,N,R,T,V,W,X,Y,Ezh
*  Changes to diacritics so that standard 'comb' and 'combcase' diacritics are used.
*  Improved diacritic placement and design especially tilde, caron, acute, grave
*  Addition of support for stacking diacritics to support new langauge support for example 'emacronacute' ( Unicode 1E17 )
*  Addition of new diacritics including commaturnedmod, doubleprimemod, firsttonechinese, fourthtonechinese, primemod, ringhalfleft, ringhalfright, secondtonechinese, verticallinelowmod, verticallinemod, dblgravecomb, brevebelowcomb, macronbelowcomb, strokeshortcomb, strokelongcomb
*  Changed the aproach to Aringacute to be consistent with the more permissive verical metrics. Thanks Vietnamese and other stacking glyphs!
*  Added support for scandinavian symbols accountof, addressedtothesubject, ( Unicodes 2100 and 2101)
*  Added Currency symbols hryvnia, kip, manat, tenge, tugrik
* Added Arrow symbols to Italic
* Added Greek letters ( Delta, Omega, mu ) and rationalized their names and unicodes vs Ohm, increment, product, summation
*  Tabular Lining figures and Tabular Old Style figures added to Italic.
*  Improved premade fractions with kerning of their components
*  Improved verical placement of inferior and superior small numbers.
*  4 kinds of small numbers for fractions, superiors for foot notes and inferiors for scientific notation to Italic.
*  Corrected design mistake in Cyrillic glyph "Komizje-cy" ( Unicode 0504 )
*  Created initial version of small caps for Roman and Italic in the sources. However they don't currently export because they are a) not done and b) have no kerning. Small caps are made for Latin, Cyrillic, Greek Symbols and Figures. Small caps are using comb diacritics. Small cap punctuation and currency could be added - I am not sure if I think this make sense or not yet.
        Notes:
        - I also don't yet understand what the best design approach to small caps for digraphs including DZ, DZcaron, Dz, Dzcaron, NJ, Nj, is.
        - The final remix RMX Scaller settings used to make the small caps were Width 96, Height 87 Weight 2 and 1 and adjust spacing 2.
*  Improved number or figure design for both Roman and Italic
*  Made many under the hood changes in Glyphs to make the files more effcient to work in in glyphs by linking sidebearings, widths and updating kern groups. This was especially touchy for cyrillic because many of the italic forms can't be linked in a parallel to their roman or upright opposites.
*  Improved Ldot but I don't feel this solution is final.
*  Cyrillic kerning is still not really complete.
* Support for Serbian added ( be-cy.loclSRB ) but not yet Serbian Italic.
* Full pinyin support still requires 8 more glyphs.
*  Discovered that changing the name NULL to uni0000 permits Glyphs to export a Variable Font from sources
*  Support for the following Google glyph sets is complete
     - Core
     - Plus Optional
     - Plus Unique
     - Pro Unique
     - Pro Optional
* Support for Google glyph sets "expert_unique-glyphs" which contains small caps is next 
 
### 18 April 2018 (Eben Sorkin) Merriweather v2.003

*  Tabular Lining figures and Tabular Old Style figures added
*  4 kinds of small numbers for fractions, superiors for foot notes and inferiors for scientific notation.
*  Quotes ‘“”’ scaled to work better with high rez screens.
*  Tal Lemming OT code for fractions
*  Many adjustment to diacritics. 
 	- Improvements for consistency in approach between roman and Italic. 
 	- Especially improved capital diacritics which are larger and clearer now. 
 	- Vietnamese diacritics also especially improved
 	- Many minor improvements to placement
    - Ring and ring acute are new.
*  Added support for Hungarian (leftanglebracket-math uni27E8, rightanglebracket-math uni27E9) and Uzbek and Hawaiian (uni02bb)
*  Improved symbols: radical, infinity, Ohm, literSign
*  Improved currency symbols
*  Improved eth
*  Added many precomposed fractions.
*  Added bitcoin currency symbol
*  Added back hyphen which some how went missing. (uni2010)
*  Added support for Skolt Sami - Gstroke gstroke Ezh ezh Kcaron kcaron
*  Fixed interpolation error in quotedblright.ss01
*  Made the included space glyphs match from Roman to Italic
* Spaces added: - Enquad (U+2000) - Emspace (U+2003) - narrow nbspace (U+202F). Also fourperemspace, punctuationspace, sixperemspace, threeperemspace

### 30 Oct 2017 (Eben Sorkin) Merriweather v2.002

* Made first Variable font version with the Roman. Italic is not generating yet.

General
* Fixed interpolation issues in Both Roman and italic. 
*  Quotes ‘“”’ made clearer. 
* ‹›«» made less wide and more typical
* All dashes and math symbols: heights corrected.
* ¿ ? adjusted to be somewhat less distinctive 
* all 10 arrows → now included 
* Diacritic anchor positions made common across family
* Combining Diacritics centered on zero widths
* Diacritic design generally improved and Vietnamese diacritics made so they are not made from composites (properly designed) and so they won’t be clipped.
* File efficiency gained from forcing all glyphs that should made only from composites to do so. 
* Clunky spacing and design for in some Currency glyphs corrected
* Lining Figures Added
* Zero slash added
* Non standard use of composites (flipped shapes) corrected
* Missing Latin glyphs added
* Total Glyph count in Roman and Italic made to match.
* Open Type code added: aalt, ccmp, locl, sups, numr, dnom, frac, ordn, lnum, onum, case, liga, zero, cpsp
* Added the Published (circle P) symbol
* OpenType Features: Update code for more languages
* Fractions: Improved and added limited support for inferior or subscript numbers
* Weight Scale: Altered instance weights across roman and italic so nominal weights appear more even; italics are still slightly lighter, but less contrast with roman
* Symbols: Made all styles share reference glyphs for copyright, registered and published symbols
* Added Gawker/Elizabeth Style curling quotes, dollar and question mark and mediumBlackSquare (uni25FC) to a Stylistic set (ss01) 

Language
* Latin: Found and upgraded all non-combining diacritics to combining, and all combining now have zero width
* Cyrillic: Found and fixed many side-bearing problems
* Vietnamese: Fixed diacritics and the glyphs they are used for, as well as the o and u horns

Technology
* OTF: Improved blue zones for PS OTFs

Italic specific fixes
* Missing Cyrillic glyphs in Italic added
* Fixed denominator and fraction glyphs
* Corrected weight inconsistency in Currency Glyphs

### 2 Feb 2017 (Marc Foley) Merriweather v2.001

* Fixed interpolation issues in Italic

### 17 Jan 2017 (Marc Foley) Merriweather v2.000

* Added CrystalType Vietnamese extension
* Added Alexieva Cyrillic extension
* Updated font metadata

### 28 Jan 2016 (Dave Crossland) Merriweather v1.584

* Corrected name table metadata (especially in OTFs)
* Improved hinting (especially for cyrillic) with ttfautohint v1.5

### 25 Jan 2016 (Dave Crossland) Merriweather v1.583

- Fix components in some ligatures and extended latin glyphs

### 22 Jan 2016 (Dave Crossland) Merriweather v1.582

- Version numbering is unified to 1.582 across the roman and italic
- Corrected NAME table
- Further OpenType code corrections

### 12 Jan 2016 (Eben Sorkin) Merriweather v1.058 

- Version numbering is unified to 1.058 across the roman and italic
- The whole family is now hinted with TTFA 1.4.1
- Slight increase in glyphs
- OpenType code is corrected.

### 3 Jan 2014 (Eben Sorkin) Merriweather v1.057 (new numbering scheme)

- Roman is now Hinted with TTFA 1.3
- Refined the weights - the new roman weights are changed slightly
- Improved the upright or roman design with special attention to punctuation
- Improved the shapes and spacing of the Cyrillic with the kind support of users and other font designers
- Future work: The italic will need to be updated to match the weight of the roman and re-hinted next. 
- Future work: Some effort to begin supporting Vietnamese and other users not covered yet has started.

### 6 Jan 2014 (Eben Sorkin) Merriweather v1.52

- Updated copyright string in UFOs

### 3 Jan 2014 (Eben Sorkin) Merriweather v1.51 ( not pushed live )

- Added support for the currency symbols won (uni20A9) and franc (uni20A3)
- Added support for typographic features requiring glyphs uni02C9, uni00AD and uni2219 to gain full Adobe Latin 3 coverage.
- Added support for Serbian when in Latin ( uni01F1/uni01C7/uni01CA/uni01C4/uni01F2/uni01C8/uni01CB/uni01C5/uni01F3/uni01C9/uni01CC/uni01C6 )
- Added upper & lower case latin shwa uni0259, uni018F for Azerbaijani.
- Updated reference encoding to reflect these additions.

### 23 December 2013 (Eben Sorkin) Merriweather v1.5

- TTFA hinting added.
- Cyrillic coverage added including minority language support for Ukrainian, Mongolian and others. Note: no Cyrillic localizations have been made yet.
- Some additional Glyphs added including latin shwa, colonmonetary, Lira, peseta, and Turkish Lira, minute, second, Number sign with N and o, as well as the litre and estimated signs.
- Added support for a broad range of additional Latin based languages.
- Support for Romanian and Moldavian localization
- Overall adjustment in scale to make TTFA hinting effective
- Alteration of contrast in the Light weight for better rendering in Windows
- Overall improvement and refinement to the design of both upright and italic.

### 14 March 2013 (Eben Sorkin) Merriweather v1.4

- Italic Regular added

### 26 Feb 2012 (Eben Sorkin) Merriweather Sans v1.001

- Hinted font Using TTFAutohint version 0.93.8-669f
- Mastered VBF to TTF and other formats.
- Added glyphs to cover the entire Adobe Latin 3 character set. ( VBF format )

### 10 Feb 2012 (Eben Sorkin) Merriweather Sans v1.000

- Completed first complete version of Merriweather Italic in Fontlab ( VBF format )

### 29 July 2011 (Eben Sorkin) Merriweather v1.3

- Altered and improved 90% of the glyphs. 
- Added glyphs to support texts originating from Windows
  ANSI and Mac Roman encodings. 
- Adjusted diacritics further
- This may be the last update to shapes before work begins on the Sans. This means that VTT hinting should be next.

### 22 July 2011 (Eben Sorkin) Merriweather v1.287

- Adusted glyph diacritics to make them work with MS Word.
- Mastered Font from Fontlab to TTF

## Acknowledgements

If you make modifications be sure to add your name (N), email (E), web-address (if you have one) (W) and description (D).
This list is in alphabetical order.

    N: Eben Sorkin
    E: sorkineben@gmail.com
    W: www.sorkintype.com
    D: Designer and Mastering

    N:Alexei Vanyashin 
    E: a@cyreal.org
    D: Design support (Cyrillic)

    N: CrystalType 
    E: stellarmaris.novachrystalia@gmail.com
    D: Design support (Vietnamese)

    N: Marc Foley
    E: m.foley.88@gmail.com
    D: Engineer

## License

Merriweather is licensed under the SIL Open Font License v1.1 (<http://scripts.sil.org/OFL>)
To view the copyright and specific terms and conditions please refer to [OFL.txt](https://github.com/EbenSorkin/Merriweather/blob/master/OFL.txt)

## Language Coverage

OTM says that Merriweather has 145 Languages covered at 100%.

Merriweather covers at 100% the following languages definions from Pyfontaine: Manx, French (Djibouti), Rombo, Scottish Gaelic, French (Algeria), Irish, Galician, Oromo (Kenya), Spanish (Venezuela), Bosnian (Latin, Bosnia & Herzegovina), Turkish (Cyprus), Machame (Tanzania), Turkish, Hungarian (Hungary), Catalan (Andorra), English (Rwanda), Icelandic (Iceland), Croatian (Croatia), Malagasy, Scottish Gaelic (United Kingdom), Swedish (Åland Islands), Friulian, Malay (Latin), Gusii, Belarusian, English (St. Lucia), Upper Sorbian (Germany), Dutch (Netherlands), Bulgarian, Macedonian, Zulu, French (Mayotte), English (Lesotho), French (Guinea), Romanian (Romania), Sena, English (Eritrea), Ganda (Uganda), Rombo (Tanzania), Spanish (Colombia), Spanish (Chile), Spanish (Costa Rica), Spanish (Cuba), Swahili (Uganda), French (Gabon), English (Cayman Islands), Norwegian Nynorsk (Norway), English (Kiribati), Swiss German (France), Meru, English (Kenya), Kalaallisut (Greenland), Kamba (Kenya), Spanish (Honduras), French (Vanuatu), Danish (Greenland), English (Tonga), Gusii (Kenya), Kyrgyz (Cyrillic, Kyrgyzstan), Azerbaijani (Cyrillic), Mongolian (Cyrillic, Mongolia), English (Samoa), Slovenian (Slovenia), Vunjo (Tanzania), Russian (Russia), Hungarian, Italian (San Marino), Shambala, Serbian (Cyrillic, Kosovo), Sango (Central African Republic), Western Frisian (Netherlands), Machame, Breton (France), Kabuverdianu (Cape Verde), Kalenjin, Mongolian, Maltese, Malay, Afrikaans (South Africa), Walser (Switzerland), Inari Sami (Finland), English (Hong Kong SAR China), Spanish (Guatemala), Spanish (Equatorial Guinea), English (American Samoa), English (Australia), English (Anguilla), Nyankole, English (Antigua & Barbuda), Spanish (Uruguay), French, Makhuwa-Meetto, Western Frisian, French (Comoros), Serbian (Latin, Kosovo), Embu (Kenya), Finnish, English (United States, Computer), Faroese, Dutch (Sint Maarten), Meru (Kenya), Serbian, Albanian, Dutch (Suriname), Swahili, French (Réunion), Slovak, Somali, Shona, Swiss German (Switzerland), Sango, Northern Sami, French (Rwanda), English (South Sudan), English (Sint Maarten), English (Swaziland), English (Solomon Islands), English (Seychelles), English (Sudan), English (Singapore), English (St. Helena), Swedish, English (Sierra Leone), Luo (Kenya), Ganda, Luxembourgish, Latvian, Lithuanian, Russian (Belarus), Filipino, Dutch (Aruba), Uzbek (Cyrillic, Uzbekistan), Rwa, Taita, Turkish (Turkey), English (Zambia), English (South Africa), Swedish (Sweden), English (Zimbabwe), Esperanto, English, Spanish (Puerto Rico), Albanian (Kosovo), Estonian (Estonia), Spanish (Paraguay), Serbian (Latin, Bosnia & Herzegovina), Spanish (Peru), Teso (Kenya), Latvian (Latvia), Spanish (Panama), Basque, Estonian, Spanish, Russian, Kinyarwanda, Azerbaijani (Latin), Taita (Kenya), Kazakh (Cyrillic, Kazakhstan), Inari Sami, German (Austria), Bosnian (Latin), Romansh, Rundi, Romanian, Lower Sorbian, Spanish (United States), Sangu, Catalan (Italy), English (Turks & Caicos Islands), Danish (Denmark), French (French Guiana), English (Tokelau), English (Trinidad & Tobago), Asu, English (Tuvalu), Albanian (Albania), French (Equatorial Guinea), French (Guadeloupe), English (Tanzania), Asu (Tanzania), French (Niger), Norwegian Bokmål (Norway), French (New Caledonia), Kyrgyz (Cyrillic), Welsh (United Kingdom), Belarusian (Belarus), Swahili (Tanzania), Teso, Indonesian (Indonesia), Bosnian (Cyrillic), Portuguese (Guinea-Bissau), Friulian (Italy), English (Macau SAR China), English (Marshall Islands), English (Madagascar), English (Malaysia), English (Malawi), English (Malta), English (Mauritius), Swedish (Finland), English (Montserrat), English (Northern Mariana Islands), Spanish (Bolivia), Bemba, Bena, Somali (Kenya), Kalenjin (Kenya), English (Falkland Islands), English (Fiji), Norwegian Bokmål (Svalbard & Jan Mayen), English (Micronesia), Sakha, Italian (Italy), Spanish (Latin America), Samburu, Portuguese (Cape Verde), Irish (Ireland), French (Martinique), Lower Sorbian (Germany), French (Mauritania), French (Madagascar), French (St. Martin), French (Morocco), French (Monaco), French (Mali), English (Liberia), Sakha (Russia), Swahili (Congo - Kinshasa), English (Philippines), English (Pakistan), English (Pitcairn Islands), Slovenian, English (Papua New Guinea), French (Cameroon), French (Côte d’Ivoire), French (Switzerland), French (Congo - Brazzaville), French (Central African Republic), English (Puerto Rico), French (Canada), Albanian (Macedonia), Kazakh, Kikuyu, Kalaallisut, Cornish, Kyrgyz, English (Belgium), English (Barbados), Croatian (Bosnia & Herzegovina), English (Bermuda), Russian (Moldova), English (Botswana), English (Bahamas), Portuguese (Portugal), English (Belize), Luxembourgish (Luxembourg), Chiga (Uganda), Spanish (Argentina), Colognian, German, Czech (Czech Republic), French (Tunisia), Jola-Fonyi, Slovak (Slovakia), English (Ireland), French (Togo), French (Chad), English (India), English (British Indian Ocean Territory), English (Isle of Man), Quechua, English (Jamaica), Northern Sami (Sweden), Malay (Latin, Malaysia), English (Uganda), Malay (Latin, Brunei), French (France), Finnish (Finland), English (U.S. Outlying Islands), Quechua (Bolivia), Embu, English (United States), Somali (Somalia), Luyia, Somali (Ethiopia), Oromo (Ethiopia), Luo, Russian (Ukraine), Bena (Tanzania), Kabuverdianu, English (World), Uzbek (Cyrillic), Colognian (Germany), English (St. Kitts & Nevis), English (Namibia), English (Nigeria), English (Norfolk Island), English (New Zealand), Welsh, Czech, English (Nauru), English (Niue), Rwa (Tanzania), English (Guyana), Portuguese, Northern Sami (Norway), Spanish (Ceuta & Melilla), English (Guam), Spanish (Ecuador), English (Gambia), English (Ghana), English (Gibraltar), English (Grenada), Spanish (Spain), English (Guernsey), Serbian (Latin, Montenegro), English (United Kingdom), Serbian (Cyrillic, Montenegro), Bulgarian (Bulgaria), Spanish (El Salvador), Soga, Faroese (Faroe Islands), Malay (Latin, Singapore), Dutch (Belgium), French (French Polynesia), Ossetic (Russia), German (Belgium), Morisyen (Mauritius), French (St. Pierre & Miquelon), Vunjo, Italian (Switzerland), Spanish (Canary Islands), Serbian (Cyrillic, Serbia), Icelandic, Italian, French (Burundi), French (Benin), French (St. Barthélemy), Makonde (Tanzania), French (Belgium), French (Burkina Faso), Dutch (Caribbean Netherlands), Portuguese (Brazil), Soga (Uganda), Rundi (Burundi), Galician (Spain), French (Mauritius), German (Liechtenstein), Shona (Zimbabwe), German (Luxembourg), Malagasy (Madagascar), Romansh (Switzerland), Sena (Mozambique), Dutch (Curaçao), Swiss German, Ossetic (Georgia), Spanish (Nicaragua), Morisyen, Shambala (Tanzania), Jola-Fonyi (Senegal), English (Jersey), French (Wallis & Futuna), Teso (Uganda), Mongolian (Cyrillic), Bosnian (Cyrillic, Bosnia & Herzegovina), Portuguese (Timor-Leste), Catalan, Afrikaans (Namibia), Kazakh (Cyrillic), Filipino (Philippines), Serbian (Cyrillic), Portuguese (Mozambique), Cornish (United Kingdom), Macedonian (Macedonia), Swiss German (Liechtenstein), French (Luxembourg), Uzbek (Latin), Danish, Catalan (France), Basque (Spain), Portuguese (Macau SAR China), Quechua (Peru), Makonde, Somali (Djibouti), Indonesian, Samburu (Kenya), North Ndebele (Zimbabwe), Upper Sorbian, English (Canada), Bemba (Zambia), English (Cocos [Keeling] Islands), English (Cook Islands), English (Cameroon), Chiga, Kamba, Breton, Bosnian, English (Christmas Island), Oromo, Russian (Kazakhstan), English (Diego Garcia), Serbian (Latin, Serbia), English (Dominica), Russian (Kyrgyzstan), Luyia (Kenya), Ossetic, Serbian (Latin), Quechua (Ecuador), Portuguese (Angola), Azerbaijani (Latin, Azerbaijan), Makhuwa-Meetto (Mozambique), Serbian (Cyrillic, Bosnia & Herzegovina), Sangu (Tanzania), German (Switzerland), French (Senegal), French (Congo - Kinshasa), Catalan (Spain), Walser, French (Seychelles), Lithuanian (Lithuania), English (Palau), French (Syria), English (Europe), English (St. Vincent & Grenadines), English (British Virgin Islands), Croatian, English (U.S. Virgin Islands), Maltese (Malta), Zulu (South Africa), English (Vanuatu), Northern Sami (Finland), Uzbek, French (Haiti), Polish, Uzbek (Latin, Uzbekistan), Kikuyu (Kenya), Afrikaans, Azerbaijani, Kinyarwanda (Rwanda), Nyankole (Uganda), Dutch, Norwegian Nynorsk, Manx (Isle of Man), Norwegian Bokmål, North Ndebele, Spanish (Philippines), Portuguese (São Tomé & Príncipe), Azerbaijani (Cyrillic, Azerbaijan), German (Germany), Spanish (Mexico), Swahili (Kenya), Spanish (Dominican Republic), Romanian (Moldova), Polish (Poland), Extensis Abaza + Cyrillic, Extensis Abkhazian + Cyrillic, Extensis Adyghian + Cyrillic, Extensis Afrikaans + English, Extensis Albanian + English, Extensis Altai + Cyrillic, Extensis Avar + Cyrillic, Extensis AzerbaijaniLatin + English, Extensis Baltic + English, Extensis Bashkir + Cyrillic, Extensis Basque + English, Extensis Bulgarian + Cyrillic, Extensis Buryat + Cyrillic, Extensis Catalan + English, Extensis Chechen + Cyrillic, Extensis Chuvash + Cyrillic, Extensis Czech + English, Extensis Danish + English, Extensis Dutch + English, Extensis Euro, Extensis EuropeanWestern, Extensis Latin, Extensis LatinLigatures, Extensis Russian, Extensis Tajik, Extensis TalyshCyrillic, Extensis TurkmenCyrillic, Extensis Tuvan, Extensis Udmurt, Subset cyrillic-menu, Subset cyrillic, African, Native name: Afrikaans, Baltic, Native name: Baltic, Basic Cyrillic, Native name: Кири́ллица, Basic Latin, Native name: Basic Latin, Catalan, Native name: Català, Central European, Native name: Central European, Danish Accents, Native name: Danske Accenter, Full Danish Alphabet, Native name: Fuld Dansk Alfabet, Finnish Accents, Native name: Suomi Aksentti, Full Finnish Alphabet, Native name: Koko Suomi Alphabet, Google cyrillic, Icelandic Accents, Native name: Íslenska Akcenty, Polish Accents, Native name: Polskie Akcenty, Full Polish Alphabet, Native name: Pełny Polski Alfabet, Slovak Accents, Native name: Slovenský Akcenty, Full Slovak Alphabet, Native name: Slovenský Abeceda, Western European, Native name: Western European

Thanks!
