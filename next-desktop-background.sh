#!/bin/bash
# If there's an explicit "next background" command, I don't know what it is.
# However, if the "random order" setting is enabled, then disabling and
# re-enabling the slideshow will cause it to pick a new random image, which
# effectively does the same thing. If the "random order" setting is disabled
# then this will just select the first image. This is not a valid use case and
# therefore not a bug. Random order is enabled with
#     gsettings set org.cinnamon.desktop.background.slideshow random-order true
# for those who cannot find the Backgrounds menu.
gsettings set org.cinnamon.desktop.background.slideshow slideshow-enabled false
sleep 0.1
gsettings set org.cinnamon.desktop.background.slideshow slideshow-enabled true
