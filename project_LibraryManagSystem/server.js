// const { MongoClient }=require('mongodb');
// //connect to MongoDB
// var url='mongodb://127.0.0.1:27017';
// //create a new mongo client
// const client=new MongoClient(url);
// //connect to mongoDB server
// client.connect(function(err){
//   if (err) throw err;
//   //Access the database
//   const db=client.db('orders');
//   console.log("Database connected!");
//   //close the connection
//   client.close();

// });

// var MongoClient = require('mongodb').MongoClient;
// var url = "mongodb://127.0.0.1:27017/orders";

// MongoClient.connect(url, function(err, db) {
//   if (err) throw err;
//   console.log("Database created!");
//   db.close();
// });
 

const { MongoClient } = require('mongodb');

async function connectToMongoDB() {
  try {
    const client = new MongoClient('mongodb://127.0.0.1:27017', { useNewUrlParser: true, useUnifiedTopology: true });
    await client.connect();
    console.log('Connected to MongoDB');
    // Access a specific database
    const database = client.db('orders');

    // Perform operations within the database
    //const collection = database.collection('your-collection-name');
    // Example: Insert a document
    // const document = { name: 'John Doe', age: 30 };
    // const result = await collection.insertOne(document);
    // console.log('Inserted document:', result.insertedId);

    // Continue with other operations as needed

    // Close the MongoDB connection when done
    await client.close();
    console.log('Disconnected from MongoDB');
    // Add your database operations here

    
  } catch (error) {
    console.error('Error connecting to MongoDB:', error);
  }
}
connectToMongoDB();


//connect with mySQL

// var mysql = require('mysql');

// var con = mysql.createConnection({
//   host: "localhost",
//   user: "root",
//   password: "Addisu++16",
//   database:"world"
// });

// con.connect(function(err) {
//   if (err) throw err;
//   console.log("Connected!");
//   // con.query("CREATE DATABASE mydb", function (err, result) {
//   //   if (err) throw err;
//   //   console.log("Database created");
//   // });
// });