const app = require('express').Router();
const lostmodel = require('../model/lost.modal');

app.post('/registerlost', async (req, res, next) => {
    try{
        const {uid,img,des} = req.body;
        const creteuser = new lostmodel({uid,img,des});
        await creteuser.save();
        res.json({status:true,message:"lost registered Sucessfully"});
    } catch (e){
        console.log(e)
        res.json({status:false,message:"server error controller register"});
    }
});

app.post('/alllost', async (req, res, next) => {
    try{
        user = await lostmodel.find();
        user = user.reverse();
        res.status(200).json({data:user});       
    } catch (e){
        console.log(e)
        res.json({data:[]});
    }
});

app.post('/deletelost', async (req, res, next) => {
    try{
        const {id} = req.body;
        await lostmodel.findByIdAndDelete(id);
        res.status(200).json({status:true});       
    } catch (e){
        console.log(e)
        res.json({status:false});
    }
});

module.exports = app;
