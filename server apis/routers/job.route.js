const app = require('express').Router();
const jobmodel = require('../model/job.modal');

app.post('/registerjob', async (req, res, next) => {
    try{
        const {uid,img,title,des} = req.body;
        const creteuser = new jobmodel({uid,img,title,des});
        await creteuser.save();
        res.json({status:true,message:"job registered Sucessfully"});
    } catch (e){
        console.log(e)
        res.json({status:false,message:"server error controller register"});
    }
});

app.post('/alljob', async (req, res, next) => {
    try{
        user = await jobmodel.find();
        user = user.reverse();
        res.status(200).json({data:user});       
    } catch (e){
        console.log(e)
        res.json({data:[]});
    }
});

app.post('/updatejob', async (req, res, next) => {
    try{
        const {id,img,title,des} = req.body;
        await jobmodel.findByIdAndUpdate(id,{
            img:img,title:title,des:des});
        res.status(200).json({status:true});       
    } catch (e){
        console.log(e)
        res.json({status:false});
    }
});

app.post('/deletejob', async (req, res, next) => {
    try{
        const {id} = req.body;
        await jobmodel.findByIdAndDelete(id);
        res.status(200).json({status:true});       
    } catch (e){
        console.log(e)
        res.json({status:false});
    }
});

module.exports = app;
