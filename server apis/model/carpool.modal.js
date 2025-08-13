const mongoose = require('mongoose');
const db = require('../config/db');

const { Schema } = mongoose;

const carpoolSchema = new Schema({
    uid:{
        type:String,  
    },
    to:{
        type:String,  
    },
    form:{
        type:String,
    },
    date:{
        type:String,
    },
    seats:{
        type:String,
    },
    charges:{
        type:String,
    }
});

const carpoolModel = db.model('carpoolSchema',carpoolSchema);
module.exports = carpoolModel;