const app = require('express').Router();
const groupmodel = require('../model/group.modal');

app.post('/registergroup', async (req, res, next) => {
    try{
        const {title,img} = req.body;
        const creteuser = new groupmodel({title,img});
        await creteuser.save();
        res.json({status:true,message:"group registered Sucessfully"});
    } catch (e){
        console.log(e)
        res.json({status:false,message:"server error controller register"});
    }
});

app.post('/allgroup', async (req, res, next) => {
    try{
        const user = await groupmodel.find();
        res.status(200).json({data:user});       
    } catch (e){
        console.log(e)
        res.json({data:[]});
    }
});

module.exports = app;
