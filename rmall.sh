#!/bin/bash

# Title : Remove All
## written by: 4ryanmckay2@gmail.com - 16/09/15
# Recursively removes all including the directory Supplied. Will prompt prior to deletion

## Usage: ./rmall.sh <dir> ##

dir="$1"
if ! [ -d "$dir" ]; then
  echo "$0: Supplied argument "$dir" is not a valid directory"
  echo "usage: $0 <dir>"
  exit 1
fi

cd "$dir"
for f in .* *; do
  case $f in
  .|..) # do nothing
      ;;
  *)
      if [ -f "$f" ]; then
        rm "$f"
      fi
      ;;
  esac
done
for d in .* *;do
  case $d in
  .|..) #nothing
      ;;
  *)
      if [ -d $d ]; then
        echo -n "Delete $d?"
        read confirm
        if [ "$confirm" == "yes" ]; then
          rm -rf $d
        else
          echo "$0 process terminated"
          exit 1
        fi
      else
        echo "$0: $d not a dir"
      fi
  esac
done
