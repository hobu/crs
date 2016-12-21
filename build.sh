
sql="sqlite3"
dbname="epsg.sqlite"

rm $dbname

data=$(ls *_Data_*.sql)
tables=$(ls *_Tables_*.sql)

# CHR function in PostgreSQL is called Char in sqlite
gsed -i 's/CHR/Char/g' $data

$sql $dbname < $tables
$sql $dbname < $data


