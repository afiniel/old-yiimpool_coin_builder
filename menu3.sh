#!/usr/bin/env bash
#####################################################
# Source code https://github.com/end222/pacmenu
# Updated by Cryptopool-Builders  for crypto use...
# Current Author Afiniel for crypto use.
#####################################################

source /etc/functions.sh
cd $HOME/yiimpool/daemon_builder

RESULT=$(dialog --stdout --title "Afiniel Coin Daemon Installer v4.7.3" --menu "Choose one" -1 60 4 \
1 "Update Berkeley 4.x Coin with autogen file" \
2 "Update Berkeley 5.x Coin with autogen file" \
3 "Update Coin with makefile.unix file" \

4 Exit)

if [ $RESULT = ]
then
exit;
fi

if [ $RESULT = 1 ]
then
clear;
echo '
autogen=true
berkeley="4.8"
' | sudo -E tee $HOME/yiimpool/daemon_builder/.my.cnf >/dev/null 2>&1;
source upgrade.sh;
fi

if [ $RESULT = 2 ]
then
clear;
echo '
autogen=true
berkeley="5.3"
' | sudo -E tee $HOME/yiimpool/daemon_builder/.my.cnf >/dev/null 2>&1;
source upgrade.sh;
fi

if [ $RESULT = 3 ]
then
clear;
echo '
autogen=false
' | sudo -E tee $HOME/yiimpool/daemon_builder/.my.cnf >/dev/null 2>&1;
source upgrade.sh;
fi

if [ $RESULT = 4 ]
then
clear;
exit;
fi
