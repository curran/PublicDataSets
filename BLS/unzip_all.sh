#!/bin/bash
#for ((  i = 1990 ;  i <= 2011;  i++  ))
for ((  i = 2010 ;  i <= 2010;  i++  ))
do
  cd $i
  for file in `ls -1 *.zip *.ZIP`
  do
      unzip $file
      rm $file
  done
  cd ../
done
