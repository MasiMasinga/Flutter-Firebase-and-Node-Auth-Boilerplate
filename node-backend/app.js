const express = require("express");
const bodyParser = require("body-parser");
const routes = require("./routes/index");
require('dotenv').config()

const app = express();

app.use(bodyParser.json());

app.use("/auth", routes);

app.use((err, req, res) => {
  console.error(err);
  res.status(500).json({ message: "Internal server error" });
});
const PORT = process.env.PORT;

app.listen(PORT, () => {
  console.log("Flutter Auth Node Boilerplate");
  console.log(`🚀Server Started on PORT ${PORT}`);
});
