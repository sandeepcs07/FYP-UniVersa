const app = require('express').Router();
const todolistmodel = require('../model/todolist.modal');

app.post('/registertodolist', async (req, res, next) => {
    try{
        const {uid,title,des,date} = req.body;
        const creteuser = new todolistmodel({uid,title,des,date});
        await creteuser.save();
        res.json({status:true,message:"todolist registered Sucessfully"});
    } catch (e){
        console.log(e)
        res.json({status:false,message:"server error controller register"});
    }
});

app.post('/alltodolist', async (req, res, next) => {
    try{
        user = await todolistmodel.find();
        user = user.reverse();
        res.status(200).json({data:user});       
    } catch (e){
        console.log(e)
        res.json({data:[]});
    }
});

app.post('/updatetodolist', async (req, res, next) => {
    try{
        const {id,title,des,date} = req.body;
        await todolistmodel.findByIdAndUpdate(id,{title:title,des:des,date:date});
        res.status(200).json({status:true});       
    } catch (e){
        console.log(e)
        res.json({status:false});
    }
});

app.post('/deletetodolist', async (req, res, next) => {
    try{
        const {id} = req.body;
        await todolistmodel.findByIdAndDelete(id);
        res.status(200).json({status:true});       
    } catch (e){
        console.log(e)
        res.json({status:false});
    }
});

module.exports = app;
