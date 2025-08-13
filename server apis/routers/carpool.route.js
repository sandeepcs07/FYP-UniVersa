const app = require('express').Router();
const carpoolmodel = require('../model/carpool.modal');

app.post('/registercarpool', async (req, res, next) => {
    try{
        const {uid,to,form,date,seats,charges} = req.body;
        const creteuser = new carpoolmodel({uid,to,form,date,seats,charges});
        await creteuser.save();
        res.json({status:true,message:"carpool registered Sucessfully"});
    } catch (e){
        console.log(e)
        res.json({status:false,message:"server error controller register"});
    }
});

app.post('/allcarpool', async (req, res, next) => {
    try{
        user = await carpoolmodel.find();
        user = user.reverse();
        res.status(200).json({data:user});       
    } catch (e){
        console.log(e)
        res.json({data:[]});
    }
});

app.post('/updatecarpool', async (req, res, next) => {
    try{
        const {id,to,form,date,seats,charges} = req.body;
        await carpoolmodel.findByIdAndUpdate(id,{to:to,
            form:form,date:date,seats:seats,charges:charges});
        res.status(200).json({status:true});       
    } catch (e){
        console.log(e)
        res.json({status:false});
    }
});

app.post('/deletecarpool', async (req, res, next) => {
    try{
        const {id} = req.body;
        await carpoolmodel.findByIdAndDelete(id);
        res.status(200).json({status:true});       
    } catch (e){
        console.log(e)
        res.json({status:false});
    }
});

module.exports = app;
