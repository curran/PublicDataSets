#!/bin/bash
dbname=us # The name of the database to import to
tableprefix=bls # The prefix of the table names
importscriptname=import_all.sql # The name of the SQL script which will be generated

echo > $importscriptname #ensure the file is cleared before appending to it

#for ((  i = 1990 ;  i <= 2011;  i++  ))
for ((  i = 2010 ;  i <= 2010;  i++  ))
do
  tablename=$tableprefix$i
  sed -e s/dbname/$dbname/g -e s/tablename/$tablename/g create_table.txt >> $importscriptname
  cd $i/state
  for file in `ls -1 allsta*`
  do
    echo importing file $file
    filepath=`pwd`/$file
    filepath=`echo $filepath|sed -e 's/\\//\\\\\\//g'`
    sed -e s/filepath/$filepath/g -e s/dbname/$dbname/g -e s/tablename/$tablename/g ../../load_enb.txt >> ../../$importscriptname
  done
  cd ../
done
