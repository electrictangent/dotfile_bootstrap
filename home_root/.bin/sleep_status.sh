#!/bin/bash

#pidof xautolock

if [ -z "$(pidof xss-lock)" ]; then
  echo '    Sleep is disabled  '
else
  echo '    Sleep is enabled  '
fi
