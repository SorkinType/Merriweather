#!/bin/sh

# A script to run both variable & static build scripts

source venv/bin/activate
set -e

sources/build-var.sh

sources/build-statics.sh
