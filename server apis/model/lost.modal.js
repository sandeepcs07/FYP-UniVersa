const mongoose = require('mongoose');
const db = require('../config/db');

const { Schema } = mongoose;

const lostSchema = new Schema({
    uid:{
        type:String,  
    },
    img:{
        type:String,
    },
    des:{
        type:String,
    },
});

const lostModel = db.model('lost',lostSchema);
module.exports = lostModel;