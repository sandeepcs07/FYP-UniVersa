const express = require("express");
const bodyParser = require("body-parser")
const UserRoute = require("./routers/user.route");
const eventRoute = require("./routers/event.route");
const timetableRoute = require("./routers/timetable.route");
const jobRoute = require("./routers/job.route");
const chatRoute = require("./routers/chat.route");
const groupRoute = require("./routers/group.route");
const notesRoute = require("./routers/notes.route");
const marketRoute = require("./routers/market.route");
const carpoolRoute = require("./routers/carpool.route");
const lostRoute = require("./routers/lost.route");
const resourceRoute = require("./routers/resource.route");
const todolistRoute = require("./routers/todolist.route");

const app = express();
app.use(bodyParser.json());
app.use("/",UserRoute);
app.use("/",eventRoute);
app.use("/",timetableRoute);
app.use("/",jobRoute);
app.use("/",chatRoute);
app.use("/",groupRoute);
app.use("/",notesRoute);
app.use("/",marketRoute);
app.use("/",carpoolRoute);
app.use("/",lostRoute);
app.use("/",resourceRoute);
app.use("/",todolistRoute);

module.exports = app;
