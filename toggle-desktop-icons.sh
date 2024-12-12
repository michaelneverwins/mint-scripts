#!/bin/bash
# The first Boolean value determines whether icons are shown on the primary
# monitor, while the second Boolean value determines whether icons are shown on
# non-primary monitors. Therefore:
#     'true::true' == "Show desktop icons on all monitors"
#     'true::false' == "Show desktop icons on primary monitor only"
#     'false::true' == "Show desktop icons on non-primary monitor(s) only"
#     'false::false' == "No desktop icons"
# This script just toggles between the first and last options, and I don't care
# because I have only one monitor plugged in as of writing this comment.
if [ "$(gsettings get org.nemo.desktop desktop-layout)" == "'false::false'" ]
then
	gsettings set org.nemo.desktop desktop-layout "'true::true'"
else
	gsettings set org.nemo.desktop desktop-layout "'false::false'"
fi
