
const express = require("express");
const socketModule = require("socket.io");
const admin = require("firebase-admin");
const dotenv = require("dotenv");
dotenv.config({path: "./config/config.env"});

const connectDB = require("./config/mongodb");

const redisClient = require("./config/redis_client");

const SERVER_PORT = process.env.PORT || 4000;

const accountRoutes = require("./routes/discord_accounts");


var app = express();
app.use(express.static("public"));
app.use(express.json());

var server = app.listen(SERVER_PORT, () => {
    console.log("Listening to requests on port: " + SERVER_PORT.toString() + " in " + process.env.NODE_ENV + " mode.");
    connectDB();

    admin.initializeApp({
        credential: admin.credential.applicationDefault()
    })

    
    app.use("/discord_accounts", accountRoutes);
});



var io = socketModule(server);

io.on("connection", (socket) => {
    console.log("Made socket connection:" + socket.id);

    socket.on("login", (data) => {

        //verify jwt
        //update it's status in redis
        //store user id for the socket id
       console.log(data.jwt);
    });

    socket.on('disconnect', async () => {
        console.log('Got disconnect!');
    
        //get user that is using the socket id
        const user = redisClient.getSomething(socket.id);
            
     });
     

     socket.on("message", (message) => {
        
     });

});






