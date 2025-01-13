

using MongoDB.Bson;
using MongoDB.Bson.IO;
using MongoDB.Driver;

var doc = new BsonDocument {
    { "FirstName", "Fredrik" },
    { "LastName", "Johansson" },
    { "Contacts", new BsonDocument {
        { "Phone", "03298273423" },
        { "Email", "fredrik@gmail.com" }
    } },
    { "List", new BsonArray {
        1,
        5,
        123,
        "Hej",
        2,
        new BsonDocument {
            { "Key", "Value" }
        }
    } }
};

doc.Add("Color", "Blue");

doc.Set("FirstName", "Kalle");
doc["FirstName"] = "Pelle";

doc.Remove("LastName");

var jsonSettings = new JsonWriterSettings { Indent = true };

//Console.WriteLine(doc.ToJson(jsonSettings));

//Console.WriteLine($"\nFirstname = {doc["First_Name"]}");

//Console.WriteLine();
//Console.Write("Enter key: ");
//var myKey = Console.ReadLine();

//if (doc.TryGetValue(myKey, out BsonValue myValue))
//{
//    Console.WriteLine($"{myValue.ToString()}");
//}
//else
//{
//    Console.WriteLine($"Key '{myKey}' does not exists.");
//}

var connectionString = "mongodb+srv://fredrik:fredrik@cluster0.9zffbjc.mongodb.net/";

var client = new MongoClient(connectionString);

//var myCollection = client.GetDatabase("iths").GetCollection<BsonDocument>("myCollection");
//myCollection.InsertOne(doc);

var movieCollection = client.GetDatabase("sample_mflix").GetCollection<BsonDocument>("movies");

var filter = Builders<BsonDocument>.Filter.Regex("title", "/matrix/i");

var projection = Builders<BsonDocument>.Projection
    .Include("title")
    .Include("year")
    .Include("plot")
    .Include("imdb.rating")
    .Exclude("_id");

//var movie = movieCollection.Find(filter).Project(projection).FirstOrDefault();
//Console.WriteLine(movie.ToJson(jsonSettings));

var movies = movieCollection.AsQueryable().Where(m => m["title"].ToString().ToLower().Contains("matrix")).ToList();
movies.ForEach(m => Console.WriteLine($"{m["title"]}"));



