#!/bin/bash
colors=`cat $HOME/.cache/wal/colors.Xresources | grep "^*color" | tr -d "*:" | sed 's/ //g' | sed 's/#/="/g' | sed ':a;N;$!ba;s/\n/"\,\n/g'`
colors="${colors}\""
echo $colors

cat ~/.config/conky/template/clock.conf | awk -v srch="-- insert --" -v repl="$colors" '{ sub(srch,repl,$0); print $0 }' > ~/.config/conky/pywal_applied/clock.lua
cat ~/.config/conky/template/network.conf | awk -v srch="-- insert --" -v repl="$colors" '{ sub(srch,repl,$0); print $0 }' > ~/.config/conky/pywal_applied/network.lua
sed -i "s/--networkcard--/${1}/" ~/.config/conky/pywal_applied/network.lua
