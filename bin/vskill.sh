#!/bin/bash

pid1=$(ps -ef \
| grep -w code \
| grep -v 'grep --color=auto -i' \
| awk '{print $2}' \
| sort -n \
| head -1)

[ $pid1 ] && kill $pid1