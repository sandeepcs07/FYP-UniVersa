const app = require('express').Router();
const timetablemodel = require('../model/timetable.modal');

app.post('/registertimetable', async (req, res, next) => {
    try{
        const {uid,img} = req.body;
        const creteuser = new timetablemodel({uid,img});
        await creteuser.save();
        res.json({status:true,message:"timetable registered Sucessfully"});
    } catch (e){
        console.log(e)
        res.json({status:false,message:"server error controller register"});
    }
});

app.post('/alltimetable', async (req, res, next) => {
    try{
        user = await timetablemodel.find();
        user = user.reverse();
        res.status(200).json({data:user});       
    } catch (e){
        console.log(e)
        res.json({data:[]});
    }
});

app.post('/updatetimetable', async (req, res, next) => {
    try{
        const {id,img} = req.body;
        await timetablemodel.findByIdAndUpdate(id,{img:img});
        res.status(200).json({status:true});       
    } catch (e){
        console.log(e)
        res.json({status:false});
    }
});

app.post('/deletetimetable', async (req, res, next) => {
    try{
        const {id} = req.body;
        await timetablemodel.findByIdAndDelete(id);
        res.status(200).json({status:true});       
    } catch (e){
        console.log(e)
        res.json({status:false});
    }
});

module.exports = app;
