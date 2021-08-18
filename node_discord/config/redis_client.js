const redis = require("redis");
const REDIS_PORT = process.env.PORT || 6379;
const redisClient = redis.createClient(6379);

// promisifying redis client methods
const {promisify}  = require("util");
const hgetallAsync = promisify(redisClient.hgetall).bind(redisClient);
const hmsetAsync   = promisify(redisClient.hmset).bind(redisClient);


const getDiscordAccount = async function(id) {
    console.log("Fetching account " + id + " from Redis....");
    try {
        const account = await hgetallAsync("discord_accounts" + id);
        return account;
    }
    catch(err) {
        console.log("Error fetching account " + id + " from Redis");
        return null;
    }
}

// test are fields neccessary
const setDiscordAccount = async function(mongoAccount) {
    console.log("Setting account " + mongoAccount._id + " in Redis");
    try {
        let account = {
            "id"                : mongoAccount._id.toString(),
            "firstName"         : mongoAccount.firstName,
            "lastName"          : mongoAccount.lastName,
            "hasProfilePicture" : mongoAccount.hasProfilePicture.toString()
        }
        if( mongoAccount.birthday !== undefined) {
            account.birthday = mongoAccount.birthday.toISOString()
        }
        if( mongoAccount.profilePictureUrl !== undefined) {
            account.profilePictureUrl = mongoAccount.profilePictureUrl
        }
        if( mongoAccount.about !== undefined) {
            account.about = mongoAccount.about
        }   

        const redisAccount = await hmsetAsync("discord_accounts" + mongoAccount._id, account);
        return redisAccount;
    }
    catch(err) {
        console.log("Error setting account " + mongoAccount.id + " in Redis.");
        console.log(err);
        return null;
    }
}

const updateDiscordAccount = async function(fields) {
    console.log("Updating account " + fields._id + "in Redis.");
    try {
        const result = await hmsetAsync("discord_accounts" + fields._id, fields);
        return result;
    }
    catch(err) {
        console.log("Error updating account " + fields._id + " in Redis");
        console.log(err);
        return null;
    }   
}

module.exports = {
    getDiscordAccount,
    setDiscordAccount,
    updateDiscordAccount
}   















