# Database Application

To get the stats for a team, run the following command:
```
./getteamStats.sh "maple leafs"
```
or just
```
./getteamStats.sh leafs
```
You can also get an individuals stats:
```
./getPlayerStats.sh "auston matthews"
```
or
```
./getPlayerStats.sh 34
```

## DB Backup
To restore the database from the `database.sql` backup you cna run:
```
PGPASSWORD=[password] psql -U [user] -h [host] -p [port] -d league --set=sslmode=require < database.sql
```