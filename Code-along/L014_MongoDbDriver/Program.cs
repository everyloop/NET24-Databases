
using MongoDB.Bson;
using MongoDB.Driver;

var connectionString = "mongodb+srv://fredrik:fredrik@cluster0.9zffbjc.mongodb.net/";

var client = new MongoClient(connectionString);

//client.ListDatabaseNames().ToList().ForEach(d => Console.WriteLine(d));

var movieCollection = client.GetDatabase("sample_mflix").GetCollection<Movie>("movies");

//var filter = Builders<Movie>.Filter.Eq("title", "The Italian");
//var filter = Builders<Movie>.Filter.Gte("imdb.rating", 9);
//var filter = Builders<Movie>.Filter.In("year", new[] { 1935, 1925, 1915 });
//var filter = Builders<Movie>.Filter.AnyEq("cast", "Bruce Willis");
var filter = Builders<Movie>.Filter.Regex("title", "/matrix/i");

// var myMovie = movieCollection.Find(filter).FirstOrDefault();
//var myMovies = movieCollection.Find(filter).ToList();

//movieCollection.Find(filter).ToList().ForEach(m => Console.WriteLine($"{m.Title}: {m.Year}"));

Console.WriteLine();

var myCat = new Cat { Name = "Pelle", Color = "Black" };

var catCollection = client.GetDatabase("iths").GetCollection<Cat>("cats");

//catCollection.InsertOne(myCat);

var catFilter = Builders<Cat>.Filter.Eq("_id", new ObjectId("6784e3dd55ff159ed6b3f958"));
var catUpdate = Builders<Cat>.Update.Set("name", "måns2");

//catCollection.UpdateOne(catFilter, catUpdate);

var movies = movieCollection.AsQueryable().Where(m => m.Title.ToLower().Contains("matrix")).ToList();

movies.ForEach(m => Console.WriteLine($"{m.Title}"));

public class Cat
{
    public ObjectId Id { get; set; }
    public string Name { get; set; }
    public string Color { get; set; }

}
