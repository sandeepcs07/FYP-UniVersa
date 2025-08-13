const mongoose = require('mongoose');
const db = require('../config/db');

const { Schema } = mongoose;

const eventSchema = new Schema({
    uid:{
        type:String,  
    },
    title:{
        type:String,  
    },
    des:{
        type:String,
    },
    cat:{
        type:String,
    },
    img:{
        type:String,
    }
});

const eventModel = db.model('eventSchema',eventSchema);
module.exports = eventModel;