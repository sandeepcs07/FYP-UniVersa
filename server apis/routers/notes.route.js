const app = require('express').Router();
const notesmodel = require('../model/notes.modal');

app.post('/registernotes', async (req, res, next) => {
    try{
        const {uid,title,des} = req.body;
        const creteuser = new notesmodel({uid,title,des});
        await creteuser.save();
        res.json({status:true,message:"notes registered Sucessfully"});
    } catch (e){
        console.log(e)
        res.json({status:false,message:"server error controller register"});
    }
});

app.post('/allnotes', async (req, res, next) => {
    try{
        const {uid} = req.body;
        user = await notesmodel.find({uid:uid});
        res.status(200).json({data:user});       
    } catch (e){
        console.log(e)
        res.json({data:[]});
    }
});


app.post('/updatenotes', async (req, res, next) => {
    try{
        const {id,title,des} = req.body;
        await notesmodel.findByIdAndUpdate(id,{title:title,des:des});
        res.status(200).json({status:true});       
    } catch (e){
        console.log(e)
        res.json({status:false});
    }
});

app.post('/deletenotes', async (req, res, next) => {
    try{
        const {id} = req.body;
        await notesmodel.findByIdAndDelete(id);
        res.status(200).json({status:true});       
    } catch (e){
        console.log(e)
        res.json({status:false});
    }
});

module.exports = app;
