const app = require('express').Router();
const marketmodel = require('../model/market.modal');

app.post('/registermarket', async (req, res, next) => {
    try{
        const {uid,img,title,des} = req.body;
        const creteuser = new marketmodel({uid,img,title,des});
        await creteuser.save();
        res.json({status:true,message:"market registered Sucessfully"});
    } catch (e){
        console.log(e)
        res.json({status:false,message:"server error controller register"});
    }
});

app.post('/allmarket', async (req, res, next) => {
    try{
        const user = await marketmodel.find();
        res.status(200).json({data:user});       
    } catch (e){
        console.log(e)
        res.json({data:[]});
    }
});

app.post('/updatemarket', async (req, res, next) => {
    try{
        const {id,img,title,des} = req.body;
        await marketmodel.findByIdAndUpdate(id,{
            img:img,title:title,des:des});
        res.status(200).json({status:true});       
    } catch (e){
        console.log(e)
        res.json({status:false});
    }
});

app.post('/deletemarket', async (req, res, next) => {
    try{
        const {id} = req.body;
        await marketmodel.findByIdAndDelete(id);
        res.status(200).json({status:true});       
    } catch (e){
        console.log(e)
        res.json({status:false});
    }
});

module.exports = app;
