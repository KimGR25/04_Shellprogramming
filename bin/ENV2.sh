#!/bin/bash

. /root/bin/functions.sh

# 1) gcc
# 2) php
PkgInst "gcc php"

# 3) vscode
VScodeInst
VScodeComment

# 4) chrome
ChromeInst
