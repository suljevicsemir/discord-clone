const router = require("express").Router();
const mongoose = require("mongoose");
const redisClient = require("../config/redis_client");
const DiscordAccount = require("../models/discord_account");
const jwt = require("jsonwebtoken");




// search accounts with query
router.get("/", async (req, res) => {
    try {
        

       const x = await mongoose.connection.db.collection("discord_accounts").find({}).toArray();

        /*mongoose.connection.db.collection("discord_accounts").find({
            "firstName" : /$/,
        }, options).toArray((err, result) => {
            if(err) throw err;
            console.log(result);
            res.send(result);
        });*/
        res.json(x);

        
    }
    catch(err) {
        res.send(err);
    }
});

// get specific account
router.get("/:id", async (req, res) => {
    try {
        let cachedAccount = await redisClient.getDiscordAccount(req.params.id);

        if( cachedAccount != null) {
            cachedAccount.fromCache = true;
            return res.status(200).json(cachedAccount);
            
        }
        
        cachedAccount = await DiscordAccount.findById(req.params.id);
        cachedAccount.fromCache = false;
        const resStatus = cachedAccount == null ? 200 : 404;
        res.status(resStatus).json(cachedAccount);
    }
    catch(err) {
        res.status(400).json(err);
    }
});

// insert new account
router.post("/", async (req, res) => {
    try {
        const discordAccount = DiscordAccount(req.body);
        const savedAccount = await discordAccount.save();
        const redisAccount = await redisClient.setDiscordAccount(savedAccount);
        const token = jwt.sign({"_id" : savedAccount._id.toString()}, process.env.SECRET);
        res.header("Authorization", token).json(savedAccount);
    }
    catch(err) {
        res.json(err);
    }
});

// delete account
router.delete("/:id", async (req, res) => {
    try {

    }
    catch(err) {
        
    }
});

// update account
router.put("/:id", async (req, res) => {
    try {

        const token = req.headers.authorization;

        if(!token) {
            return res.status(403).json({"error" : "User not authenticated!"});
        }
        console.log(`Received token: ${token}`);
        const decodedToken = jwt.verify(token, process.env.SECRET);
        console.log(decodedToken);
        if( decodedToken._id != req.params.id) {
            return res.status(403).json({"error" : "JWT not valid!"});
        }
        
        const updatedAccount = await DiscordAccount.updateOne(
            {
                _id: req.params.id
            },
            {
                $set: req.body
            }
        );

        let account = req.body;
        account._id = req.params.id;
        console.log(account)
        await redisClient.updateDiscordAccount(account);
    
        res.json(updatedAccount);

    }
    catch(err) {
        res.json(err);
    }
});



module.exports = router;

