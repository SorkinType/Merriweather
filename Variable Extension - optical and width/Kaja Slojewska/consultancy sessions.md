## Skype Session 2019-11-14

Warsaw

* Smart Filters
	* Custom Glyph Info:
		* unnecessary Letter/Lowercase definition
	* Paths & Components mixed (avoid): 
		1. select paths
		2. *right click > Component From Selection*
		3. choose `_part.` name if no standard name applies
	* Empty Glyphs
	* No Kerning Groups
	* Exporting Without Unicodes
		* should only contain glyphs accessible through features, and `.notdef`
		* consider deletion (see below):
			* `/I.uc/i.dot/f_f/f_f_i/f_f_i_trk/f_f_l` and 
			* `/ustrait-cy.sc/ustraitstroke-cy.sc/uni02bb/hook_left.cy`
	* Not Auto-Aligned
		* double check component order (base glyph first):
			* *Glyph > Make Component Glyph*
			* or *Generate Glyphs* & overwrite (works on all masters at once)
		* legacy marks
			* *comb > `=40`LSB+RSB > *mekkablue > Components > Alignment Manager*
		* `/Lslash/lslash/Hbar` (+sc): consider incremental metrics key `+=20`
	* No Metrics Keys (+min 1 path)
		* `=|` for centering symmetric glyphs, also `=|n` etc.
		* do not nest, e.g. always H for straight stems

* Glyph Set
	* Ligatures? `/f_f/f_f_i/f_f_i_trk/f_f_l`
	* only `fi` and `fl` (encoded)
	* `florin=Fhook`: survives case switching (e.g. World-Ready Composer)
	* delete `i.dot` (`idotaccent` does the job better)
	* Smallcaps
		* consider .sc for:
			 * `(){}[]` (perhaps only pos in additional `c2sc` feature)
			 * `¿¡?!` aligning with SC letters (+.case)
			 * `ampersand`
	* *Other* category: `/ustrait-cy.sc/ustraitstroke-cy.sc/uni02bb/hook_left.cy/Lefttooth/Righttooth`
		* consider `_part.` naming or deletion
* Features
	* CAT:
		* `periodcentered.loclCAT` (+.case +.sc), space (no kerning) between
		* build fallback Ldot/ldot/ldot.sc with *mekkablue > Build > Ldot*
		* `locl`: take language definition out of lookup
		* consider repeating lookup in `calt` without `language` statement
			* potential other uses of `periodcentered`
		* `locl`:
		```
script latn;
language CAT;
lookup locl_CAT {
	sub l periodcentered' l by periodcentered.loclCAT;
	sub L periodcentered' L by periodcentered.loclCAT.case;
} locl_CAT;
```
		* `calt`: `lookup locl_CAT;`
	* NLD:
		* delete inaccessible `/IJacute/ijacute/ijacute.sc`
		* character stream: Iacute + J (+ acutecomb)
		* `Jacute`/`jacute` (+`.sc`):
		```
lookup NLD {
  language NLD;
  sub iacute j' by jacute;
  ignore sub J' [acutecomb acutecomb.case];
  sub Iacute J' by Jacute;
} NLD;
```
	* DEU/Germandbls: 
		* `locl` lookup (like CAT) and repeat in `calt`
		```
language DEU;
lookup capSharpS {
		sub @Uppercase @Uppercase germandbls' by Germandbls;
		sub germandbls' @Uppercase by Germandbls; 
} capSharpS;
```
	* Balkan digraphs:
		* `/DZ/DZcaron/Dz/Dzcaron/LJ/Lj/NJ/Nj/dz/dzcaron/lj/nj/dz.sc/dzcaron.sc/lj.sc/nj.sc`
		* delete `.sc` and decompose in `ccmp` lookup, repeat lookup at beginning of `smcp` and `c2sc`
	* consider similar decomposition: `/napostrophe/Ldot/ldot/IJ/ij` (and no more SC)
	* consider pos for:
		* `at.case`
		* .case dashes: `/hyphen.case/softhyphen.case/endash.case/emdash.case`
	* `zero`: order of suffixes = order of features (for automatic feature generation)
		* order feature after SC features (if you add `zero.sc.zero`)

* Design/Construction
	* `Germandbls`: like F/Gamma on the left, Z top right, S bottom right (like flat three, or ezh)
	* quotes: *mekkablue > Build Glyphs > Quote Manager*
	* math operators: *mekkablue > Spacing > Fix Math Operator Spacing*
		* `/plus/minus/multiply/divide/equal/notequal/greater/less/greaterequal/lessequal/plusminus/approxequal/asciitilde/logicalnot`
	* arrows: *mekkablue > Spacing > Fix Arrow Spacing*
	* `estimated`: *Build Glyphs > Build estimated*
	* `registered`: small and superior
	* ¿¡ for .case too low, must align
	* small figures (dnom, numr, superior, inferior): 
		* avoid nested components (setting kerning groups)
		* *mekkablue > Build > Small Figures*
	* consider `zero.sc.zero`
	* consider overlaps 
		* well tucked away in stem centers
	* *mekkablue > Paths > Find Near Vertical Misses*

* Interpolation
	* Shapeshifting
	* Point Tracking *(Travel Tracker)*
	* Kinks *(Kink Finder)*
		* keep below 1u, 0.6u perhaps?

* Kerning:
	* Consider *Font Info > Font > Use Extension Kerning*
	* Kerning Groups? 
		* No separation necessary for Cyrillic. (fontmake?)
			* go into different subtables anyway
		* Smart Filter for finding glyphs missing groups
		* small figures
		* verify in Font View / List Mode (e.g. Ldot ldot, periodcentered.loclCAT)
			* unkernable symbols (e.g. lozenge)
			* keep kerning groups small
				* dcaron, lcaron = dcaron group
				* vietnamese horn letters (ohorn, uhorn)
				* avoid exceptions (with large groups)
				* avoid exceptions with punctuation as far as possible
	* Many Masters:
		* Consider Shortcuts for *Edit > Other > Next/Previous Master*
		* Strategy:
			*  Display:
				* Interpolate Normal Width from Narrow and Wide (see below)
			*  Text:
				* Copy Kerning from Normal Widths to Narrow and Wide (Kernschmelze)
				* Process Narrow and Wide
			
			* Interpolate Kerning:
				0. Delete Existing Kerning in Master
				1. Dummy Instance (with master coordinates) active (all others inactive)
				2. Custom Parameter: Disable Masters
				3. *File > Generate Instances*
				4. Copy Kerning back to Main File
			
			* Processing:
				(0. Delete existing kerning in Window > Kerning)
				1. Group Kerning:
				  * Consider Kern Lock (To+Lock): Kerning only
				  * *Kerning > Sample String Maker*; populates Sample Strings (see Preferences and Edit > Select Sample Text); Edit > Other > Select Next/Previous Sample String (hint: add shortcut in Sys Prefs)
				  * Figures: *Spacing > New Tab with All Figure Combs* (+activate features)
				2. Exceptions: *KernCrasher* finds pairs that are too tight, *GapFinder* the opposite
				  2D spreadsheet: columns=Masters, rows=KernCrasher combos ---> tick off
				  (Consider Kerning Lock at bottom of window)
				3. AutoBumper
			
			* *Delete Small Kern Pairs*
			* *Zero Kerner*
				* for all masters
			
			* TO DO Rainer: Script to Find Exceptions (soon)


* Next Sessions:
	* Kerning
	* Hinting
