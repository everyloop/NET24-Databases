# Januari 15

## Exportera Data

Vi använder [Azure Data Studio](https://learn.microsoft.com/en-us/azure-data-studio/download-azure-data-studio?tabs=win-install%2Cwin-user-install%2Credhat-install%2Cwindows-uninstall%2Credhat-uninstall) för att exportera data till filformaten [.CSV](https://en.wikipedia.org/wiki/Comma-separated_values), [.TSV](https://en.wikipedia.org/wiki/Tab-separated_values), och [.JSON](https://en.wikipedia.org/wiki/JSON)

Vi kollar också på CLI-verktygen [mongoimport](https://www.mongodb.com/docs/database-tools/mongoimport/) och [mongoexport](https://www.mongodb.com/docs/database-tools/mongoexport/) för att importera/exportera till/från MongoDB.

Ett annat smidigt alternativ för att exportera data från MongoDB är att använda MongoDB compass, där man enkelt kan sätta upp en [pipeline](https://github.com/everyloop/NET24-Databases/blob/master/Lecture-notes/Jan8.md) för att konvertera data till önskat format och sedan exportera till .CSV eller .JSON

## Json-funktionalitet i T-SQL

Man kan enkelt få ut sin data i json-format genom att lägga till "for json auto", alternativt "for json path" i slutet på sin select-sats i T-SQL. Med "for json path" kan man strukturera upp "platt" tabelldata till en trädstruktur (json) med subdocuments på det satt man själv väljer. ("for json auto" gör formatering automatiskt.)

Om man istället har data i json-format kan man använda openrowset (för att läsa in från fil) tillsammans med openjson (för att platta ut och konvertera till tabelldata).

**Code-along:**  
[021_For_json_path.sql](https://github.com/everyloop/NET24-Databases/blob/master/SQL/021_For_json_path.sql)  
[022_Openrowset_&_openjson.sql](https://github.com/everyloop/NET24-Databases/blob/master/SQL/022_Openrowset_%26_openjson.sql)  
