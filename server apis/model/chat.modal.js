const mongoose = require('mongoose');
const db = require('../config/db');

const { Schema } = mongoose;

const chatSchema = new Schema({
    uid:{
        type:String,
    },
    did:{
        type:String,
    },
    c:[
        
    ],
    date:{
        type:String,
    },
    status:{
        type:String,
    },
});

const chatModel = db.model('chat',chatSchema);
module.exports = chatModel;