#!/bin/sh
CURRENTDIR=$1
find ${CURRENTDIR} -name "*" -o -name ".*" 2>/dev/null |sed -e 's/^\.//' |sed -n '2,$p' | while read line
do
  a=`echo $line |awk -F\/ '{print NF}'`
  a=`expr $a - 2`
  i=1
  case $a in
  0) echo $line |sed -e 's/\//|---/' ;;
  *) while [ ! $i -gt $a ]; do
       line=`echo $line |sed -e 's/\/[^\/]*/|   /'`
       i=`expr $i + 1`
     done
     echo $line |sed -e 's/\//|---/' -e 's/  */   /g';;
  esac
done
