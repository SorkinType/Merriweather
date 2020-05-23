"""
    Script to use statmake to add STAT table to Merriweather Roman and Italic
"""

import sys
import statmake.classes
import statmake.lib
from fontTools.ttLib import TTFont

font_path = sys.argv[1]

STAT = {
    "axes": [
        {
            "name": "Optical size",
            "tag": "opsz",
            "locations": [
                {
                    "name": "Small",
                    "value": 7
                },
                {
                    "name": "Text",
                    "value": 30
                },
                {
                    "name": "Head",
                    "value": 70
                },
                {
                    "name": "Display",
                    "value": 108
                },
                {
                    "name": "Big",
                    "value": 144
                }
            ]
        },
        {
            "name": "Width",
            "tag": "wdth",
            "locations": [
                {
                    "name": "SemiCondensed",
                    "value": 87.5
                },
                {
                    "name": "Normal",
                    "value": 100,
                    "flags": ["ElidableAxisValueName"]
                },
                {
                    "name": "SemiExpanded",
                    "value": 112.5
                }
            ]
        },
        {
            "name": "Weight",
            "tag": "wght",
            "locations": [
                {
                    "name": "Light",
                    "value": 300
                },
                {
                    "name": "Regular",
                    "value": 400,
                    "linked_value": 700,
                    "flags": ["ElidableAxisValueName"]
                },
                {
                    "name": "Bold",
                    "value": 700
                },
                {
                    "name": "Black",
                    "value": 900
                }
            ]
        },
        {
            "name": "Italic",
            "tag": "ital",
            "locations": [
                {
                    "name": "Roman",
                    "value": 0,
                    "linked_value": 1,
                    "flags": ["ElidableAxisValueName"]
                },
                {
                    "name": "Italic",
                    "value": 1
                }
            ]
        }
    ]
}


def makeStylespace(font_path):

    stylespace = statmake.classes.Stylespace.from_dict(STAT)

    font = TTFont(font_path)

    if "Italic" in font_path:
        addedLocs = {"Italic": 1}
    else:
        addedLocs = {"Italic": 0}

    statmake.lib.apply_stylespace_to_variable_font(
        stylespace=stylespace,
        varfont=font,
        additional_locations=addedLocs
    )
    font.save(font_path)


makeStylespace(font_path)
