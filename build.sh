
sql="sqlite3"
dbname="epsg.sqlite"

rm $dbname

data=$(ls *_Data_*.sql)
tables=$(ls *_Tables_*.sql)

# CHR function in PostgreSQL is called Char in sqlite
gsed -i 's/CHR/Char/g' $data

iconv -f ISO-8859-1 -t UTF-8 $data > $data.converted
$sql $dbname < $tables
$sql $dbname < $data.converted


