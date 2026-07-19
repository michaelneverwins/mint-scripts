#!/bin/bash
# I like the color gradient option for Cinnamon's desktop background. However,
# there does not appear to be any solid/gradient-color equivalent to the image
# background slideshow option, and any given color gradient will tend to get
# "old" even more quickly than a given background image, so I wanted to be able
# to rotate color gradients without opening the graphical backgrounds menu. It
# would probably be easy to set up this script to run periodically, but I plan
# to assign it to a keyboard shortcut just to run it whenever I feel like it.
# This is tailored to my particular preference (black on top and some color on
# the bottom), but the method of randomizing the bottom color serves as an
# adequate demonstration of how it would be done for the top color as well.
# The selection of colors here is from the bottom row of Cinnamon's background
# menu's color picker (which is the darkest row).
TOP_COLOR='#000000000000'
BOTTOM_COLORS=(
	'#1a1a5f5fb4b4'
	'#2626a2a26969'
	'#e5e5a5a50a0a'
	'#c6c646460000'
	'#a5a51d1d2d2d'
	'#616135358383'
	'#636345452c2c'
	'#9a9a99999696'
)
current_bottom_color=$(
	gsettings get org.cinnamon.desktop.background secondary-color \
	| tr -d "'"  # It prints out with literal single quotes.
)
# Efficiency be damned; I just want to guarantee a new color and this works.
bottom_color=${BOTTOM_COLORS[$((${RANDOM} % ${#BOTTOM_COLORS[@]}))]}
while [ ${bottom_color} == ${current_bottom_color} ]
do
	bottom_color=${BOTTOM_COLORS[$((${RANDOM} % ${#BOTTOM_COLORS[@]}))]}
done
gsettings set org.cinnamon.desktop.background picture-options none
gsettings set org.cinnamon.desktop.background color-shading-type vertical
gsettings set org.cinnamon.desktop.background primary-color ${TOP_COLOR}
gsettings set org.cinnamon.desktop.background secondary-color ${bottom_color}
