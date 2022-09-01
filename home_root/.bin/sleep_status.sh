#!/bin/bash

#pidof xautolock

if [ -z "$(pidof xautolock)" ]; then
  echo '    Sleep is disabled  '
else
  echo '    Sleep is enabled  '
fi
