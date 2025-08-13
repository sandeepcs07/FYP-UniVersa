const app = require('express').Router();
const usermodel = require('../model/user.modal');

app.post('/register', async (req, res, next) => {
    try{
        const {number,name,img,email,pass,cat,deviceid} = req.body;
        const user = await usermodel.findOne({email});
        if(!user){
            const creteuser = new usermodel({number,name,img,email,pass,cat,deviceid});
            await creteuser.save();
            res.json({status:true,message:"User registered Sucessfully"});
        } else{
            res.json({status:false,message:"User aldready exist"});
        }
    } catch (e){
        console.log(e)
        res.json({status:false,message:"server error controller register"});
    }
});

app.post('/login', async (req, res, next) => {
    try{
        const {email,pass,deviceid} = req.body;
        const user = await usermodel.findOne({email});
        if(!user){
            res.status(200).json({status:false,message:"no user found"});
        } else{
            const isMatch = await user.comparePassword(pass);
            if(isMatch == false){
                res.status(200).json({status:false,message:"invalid password"});
            } else{
                await usermodel.findByIdAndUpdate(user._id, { $set: { deviceid: deviceid } });
                res.status(200).json({status:true,token:user,message:"login in sucessfully"});
            }
        }
    } catch (e){
        console.log(e)
        res.json({status:false,message:"server error controller login"});
    }
});

app.post('/findone', async (req, res, next) => {
    try{
        const {email} = req.body;
        const user = await usermodel.findOne({email});
        res.status(200).json({data:user}); 
    } catch (e){
        console.log(e)
        res.json({status:false,message:"server error controller register"});
    }
});

app.post('/allusers', async (req, res, next) => {
    try{
        const user = await usermodel.find();
        res.status(200).json({data:user}); 
    } catch (e){
        console.log(e)
        res.json({status:false,message:"server error controller register"});
    }
});

module.exports = app;
