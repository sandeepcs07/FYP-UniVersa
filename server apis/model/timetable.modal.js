const mongoose = require('mongoose');
const db = require('../config/db');

const { Schema } = mongoose;

const timetableSchema = new Schema({
    uid:{
        type:String,  
    },
    img:{
        type:String,
    }
});

const timetableModel = db.model('timetable',timetableSchema);
module.exports = timetableModel;