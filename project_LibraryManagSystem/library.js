const express=require('express');
const {MongoClient}=require('mongodb');
const app=express();
const port=3000;
const dbName='orders';

//database connection configuration

const url='mongodb://127.0.0.1:27017';
const client = new MongoClient('mongodb://127.0.0.1:27017', { useNewUrlParser: true, useUnifiedTopology: true });
//connect to the database

client.connect((err)=>{
    if(err){
        console.log("error")
        console.error('Database connection error:',err);
        throw err;
    }
    console.log('connected to the databse');
   // Middleware to parse request body as JSON
   //app.use(express.json()); 
})