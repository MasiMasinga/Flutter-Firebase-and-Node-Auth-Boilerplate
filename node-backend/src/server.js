const express = require("express");
const cors = require("cors");
const bodyParser = require("body-parser");
const routes = require("./routes/index");
require("dotenv").config();

const app = express();

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(cors());
app.use(routes);

app.use((err, res) => {
  res.status(500).json({ message: "Internal server error", err });
});

const PORT = process.env.PORT;

app.listen(PORT, () => {
  console.log("Flutter Auth Node Boilerplate");
  console.log(`🚀Server Started on PORT ${PORT}`);
});
