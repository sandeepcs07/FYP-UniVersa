const mongoose = require('mongoose');
const db = require('../config/db');

const { Schema } = mongoose;

const notesSchema = new Schema({
    uid:{
        type:String,
    },
    title:{
        type:String,
    },
    des:{
        type:String,
    },
});

const notesModel = db.model('notes',notesSchema);
module.exports = notesModel;