# Januari 13

## MongoDB Driver

Vi kollar på hur man använder MongoDB Driver för att connecta mot MongoDB och göra CRUD-operationer med hjälp av Builders<> (hjälp-klasser).

Snabbreferens finns här: [https://www.mongodb.com/docs/drivers/csharp/current/quick-reference/]

**Code-along:**  
[L014_MongoDbDriver](https://github.com/everyloop/NET24-Databases/tree/master/Code-along/L014_MongoDbDriver)  

## BsonDocument

I code-along ovan (L014) använder vi collections med deserialization mot statiska klasser (till exempel 'Movie'), men man kan också använda datatype BsonDocument för representera ett godtyckligt Bson-dokument i C#, och på så vis skapa mer dynamiska program (om det behövs).

**Code-along:**  
[L015_BsonDocument](https://github.com/everyloop/NET24-Databases/tree/master/Code-along/L015_BsonDocument)  
