# BLS Employment Data Processing Scripts
These Unix shell scripts download the Bureau of Labor Statistics (BLS) Employment data set and import it into MySQL. They were developed and tested in an Ubuntu Linux environment. To use them, run them in the following order:

 - Run `./download_all.sh` to download the raw data files from the BLS FTP site.
 - Run `./unzip_all.sh` to unzip the downloaded files
 - To import state-level data into MySQL, do the following:
   - Run `./generate_sql_import_script.sh` to generate a file called `import_all.sql`
     - This script has some defaults which you can edit at the top of the file:
       - `dbname=us` The name of the database to import to
       - `tableprefix=bls` The prefix of the table names (year will be added to the end, e.g. 'bls2010')
       - `importscriptname=import_all.sql` The name of the SQL script which will be generated
   - Run the generated `import_all.sql` file as follows:
     - Start the MySQL terminal:
       - `mysql -u root -p`
     - Create a database called `us`:
       - `mysql> create database us; use us;`
     - Run the import script:
       - `mysql> source import_all.sql;`
     - Query the table to see if it worked:
       - `mysql> select * from bls2010 limit 10;`
       
Query and transform as you please!
       
Note: By default the scripts will only work over 2010 data. To work over all years, uncomment the for loop over all years in the scripts. Before doing this you may want to first test them with just 2010.
