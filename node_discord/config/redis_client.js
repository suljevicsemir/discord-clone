const redis = require("redis");
const REDIS_PORT = process.env.PORT || 6379;
const redisClient = redis.createClient(6379);

// promisifying redis client methods
const {promisify}  = require("util");
const hgetallAsync = promisify(redisClient.hgetall).bind(redisClient);
const hmsetAsync   = promisify(redisClient.hmset).bind(redisClient);


const getDiscordAccount = async function(id) {
    console.log("Fetching account " + id + " from Redis.");
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
const setDiscordAccount = async function(account) {
    console.log("Setting account " + " in Redis");
    try {
        const account = await hmsetAsync("discord_accounts" + account.id, account);
        return account;
    }
    catch(err) {
        console.log("Error setting account " + account.id + " in Redis.");
        return null;
    }
}

module.exports = {
    getDiscordAccount: getDiscordAccount,
    setDiscordAccount: setDiscordAccount
}















