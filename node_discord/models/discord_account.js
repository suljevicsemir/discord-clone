


const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const discordAccountSchema = new Schema({
    firstName: {
        type: String,
        required: true
    },
    lastName: {
        type: String,
        required: true
    },
    birthday: {
        type: Date,
        required: false
    },
    email: {
        type: String,
        required: true   
    },
    password: {
        type:String,
        required: [true, "Please enter an password"],
        minlength: [6, "Minimum password length is 6 characters."]
    },
    profilePictureUrl: {
        type: String,
        required: false
    },
    fcmToken: {
        type: String,
        required: [true, "FCM token is neccessary."]
    },
    about: {
        type: String,
        required: false,
        maxlength: [100, "About section must contain maximum 100 characters."]
    }
}, {timestamps: true});

const DiscordAccount = mongoose.model("DiscordAccount", discordAccountSchema);

module.exports = DiscordAccount;