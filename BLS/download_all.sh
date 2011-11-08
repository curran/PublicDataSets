#!/bin/bash
#for ((  i = 1990 ;  i <= 2011;  i++  ))
for ((  i = 2010 ;  i <= 2010;  i++  ))
do
  mkdir $i
  cd $i
  wget ftp://ftp.bls.gov/pub/special.requests/cew/$i/$i.all.enb.zip
  cd ../
done
