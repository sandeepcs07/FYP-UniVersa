const app = require('express').Router();
const resourcemodel = require('../model/resource.modal');

app.post('/registerresource', async (req, res, next) => {
    try{
        const {uid,img,type,des} = req.body;
        const creteuser = new resourcemodel({uid,img,type,des});
        await creteuser.save();
        res.json({status:true,message:"resource registered Sucessfully"});
    } catch (e){
        console.log(e)
        res.json({status:false,message:"server error controller register"});
    }
});

app.post('/allresource', async (req, res, next) => {
    try{
        user = await resourcemodel.find();
        user = user.reverse();
        res.status(200).json({data:user});       
    } catch (e){
        console.log(e)
        res.json({data:[]});
    }
});

app.post('/deleteresource', async (req, res, next) => {
    try{
        const {id} = req.body;
        await resourcemodel.findByIdAndDelete(id);
        res.status(200).json({status:true});       
    } catch (e){
        console.log(e)
        res.json({status:false});
    }
});

module.exports = app;
