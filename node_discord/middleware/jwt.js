
const jwt = require("jsonwebtoken");

const signJWT = (id) => {
    return jwt.sign(id, process.env.SECRET);
}

const verifyJWT = (id, token) => {

}


module.exports = {
    signJWT,
    verifyJWT
}