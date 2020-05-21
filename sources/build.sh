#!/bin/sh

# A script to run both variable & static build scripts

source venv/bin/activate
set -e

# To Build variable fonts
sources/build-var.sh

# To Build TTFs and WOFF2
sources/build-statics.sh

# To Build fontmake OTFs fonts
sources/build-fm_OTFs.sh