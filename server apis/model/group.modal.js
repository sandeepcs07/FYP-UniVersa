const mongoose = require('mongoose');
const db = require('../config/db');

const { Schema } = mongoose;

const groupSchema = new Schema({
    title:{
        type:String,
    },
    img:{
        type:String,
    },
});

const groupModel = db.model('group',groupSchema);
module.exports = groupModel;