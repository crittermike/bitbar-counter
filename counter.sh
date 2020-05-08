#!/bin/bash
# <bitbar.title>Counter</bitbar.title>
# <bitbar.version>v1.0</bitbar.version>
# <bitbar.author>Mike Crittenden</bitbar.author>
# <bitbar.author.github>mikecrittenden</bitbar.author.github>
# <bitbar.desc>Example of a simple click counter.</bitbar.desc>

COUNTER=`cat /tmp/counter 2>/dev/null`
if [ -z "$COUNTER" ]
then
  COUNTER=0
fi

if [ "$1" = "up" ]; then
  ((COUNTER=COUNTER+1))
  echo $COUNTER > /tmp/counter
elif [ "$1" = "down" ]; then
  ((COUNTER=COUNTER-1))
  echo $COUNTER > /tmp/counter
elif [ "$1" = "reset" ]; then
  echo 0 > /tmp/counter
fi

echo "$COUNTER"
echo ---
echo "Up | terminal=false bash='$0' param1='up' refresh=true"
echo "Down | terminal=false bash='$0' param1='down' refresh=true"
echo "Reset | terminal=false bash='$0' param1='reset' refresh=true"
