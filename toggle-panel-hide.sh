#!/bin/bash
# The panels-autohide value is an array of strings such as
#     ['1:false', '2:true']
# In each string, the number before the colon selects a panel (of which there
# may be more than one), while the word after the colon corresponds to one of
# the Panel menu's "Auto-hide panel" options as follows:
#     true == "Auto hide panel"
#     false == "Always show panel"
#     intel == "Intelligently hide panel"
# This script just toggles between the first two options, because if you trust
# the "intelligent" option's intelligence then you're probably not itching to
# have a custom keyboard shortcut executing a shell script that changes the
# setting on command, and all panels are toggled between these options at once,
# because I only have one panel and don't care about multiple-panel set-ups but
# I still wanted the script to be generally functional.
current_autohide_setting="$(gsettings get org.cinnamon panels-autohide)"
if [[ "${current_autohide_setting}" == *"false"* ]]
then
	pattern="s/false/true/g"
else
	pattern="s/true/false/g"
fi
gsettings set org.cinnamon panels-autohide "$(
	sed ${pattern} <<< "${current_autohide_setting}"
)"
