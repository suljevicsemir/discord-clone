

const bcrypt = require("bcrypt");
const mongoose = require("mongoose");
const Schema = mongoose.Schema;
const {isEmail} = require("validator");

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
        required: true,
        validate: [isEmail, "Please enter a valid email"]
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
    },
    hasProfilePicture: {
        type: Boolean,
        required: true
    }
}, {timestamps: true});


discordAccountSchema.pre("save", async function(next) {
    const salt = await bcrypt.genSalt();
    this.password = await bcrypt.hash(this.password, salt);
    next();
})

const DiscordAccount = mongoose.model("Discord_Accounts", discordAccountSchema);


module.exports = DiscordAccount;