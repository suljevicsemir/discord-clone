const router = require("express").Router();
const mongoose = require("mongoose");
const redisClient = require("../config/redis_client");
const DiscordAccount = require("../models/discord_account");
const jwt = require("jsonwebtoken");

// search accounts with query
router.get("/", async (req, res) => {
    /*try {
        mongoose.connection.db.collection("discord_accounts").find({
            "firstName" : /$/,
        }, options).toArray((err, result) => {
            if(err) throw err;
            console.log(result);
            res.send(result);
        });
    }
    catch(err) {
        
    }*/
});

// get specific account
router.get("/:id", async (req, res) => {
    try {
        let cachedAccount = await redisClient.getDiscordAccount(req.params.id);

        if( cachedAccount != null) {
            cachedAccount.fromCache = true;
            res.status(200).json(cachedAccount);
            return;
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
        res.json(savedAccount);
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

});


module.exports = router;

