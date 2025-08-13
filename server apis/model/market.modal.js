const mongoose = require('mongoose');
const db = require('../config/db');

const { Schema } = mongoose;

const marketSchema = new Schema({
    uid:{
        type:String,  
    },
    img:{
        type:String,
    },
    title:{
        type:String,
    },
    des:{
        type:String,
    },
});

const marketModel = db.model('market',marketSchema);
module.exports = marketModel;