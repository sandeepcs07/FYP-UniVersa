const mongoose = require('mongoose');
const db = require('../config/db');

const { Schema } = mongoose;

const jobSchema = new Schema({
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

const jobModel = db.model('job',jobSchema);
module.exports = jobModel;