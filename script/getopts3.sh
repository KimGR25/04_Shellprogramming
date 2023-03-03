#!/bin/bash

usage() {
    echo "Usage: $0 {-x|-y optarg1}"
    exit 1
}

while getopts xy: options 2>/dev/null
do
    case $options in
        x) echo "x nom" ;;
        y) echo "y nom + $OPTARG" ;;
        \?) usage ;;
        *) uasge ;;
    esac
done