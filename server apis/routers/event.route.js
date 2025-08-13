const app = require('express').Router();
const eventmodel = require('../model/event.modal');

app.post('/registerevent', async (req, res, next) => {
    try{
        const {uid,title,des,cat,img} = req.body;
        const creteuser = new eventmodel({uid,title,des,cat,img});
        await creteuser.save();
        res.json({status:true,message:"event registered Sucessfully"});
    } catch (e){
        console.log(e)
        res.json({status:false,message:"server error controller register"});
    }
});

app.post('/allevent', async (req, res, next) => {
    try{
        user = await eventmodel.find();
        user = user.reverse();
        res.status(200).json({data:user});       
    } catch (e){
        console.log(e)
        res.json({data:[]});
    }
});

app.post('/updateevent', async (req, res, next) => {
    try{
        const {id,title,des,cat,img} = req.body;
        await eventmodel.findByIdAndUpdate(id,{title:title,
            des:des,cat:cat,img:img});
        res.status(200).json({status:true});       
    } catch (e){
        console.log(e)
        res.json({status:false});
    }
});

app.post('/deleteevent', async (req, res, next) => {
    try{
        const {id} = req.body;
        await eventmodel.findByIdAndDelete(id);
        res.status(200).json({status:true});       
    } catch (e){
        console.log(e)
        res.json({status:false});
    }
});

module.exports = app;
