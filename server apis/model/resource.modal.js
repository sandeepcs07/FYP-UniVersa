const mongoose = require('mongoose');
const db = require('../config/db');

const { Schema } = mongoose;

const resourceSchema = new Schema({
    uid:{
        type:String,  
    },
    img:{
        type:String,
    },
    type:{
        type:String,
    },
    des:{
        type:String,
    },
});

const resourceModel = db.model('resource',resourceSchema);
module.exports = resourceModel;