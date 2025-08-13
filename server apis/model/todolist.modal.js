const mongoose = require('mongoose');
const db = require('../config/db');

const { Schema } = mongoose;

const todolistSchema = new Schema({
    uid:{
        type:String,  
    },
    title:{
        type:String,
    },
    des:{
        type:String,
    },
    date:{
        type:String,
    },
});

const todolistModel = db.model('todolist',todolistSchema);
module.exports = todolistModel;
