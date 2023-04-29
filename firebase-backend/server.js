const express = require("express");
const bodyParser = require("body-parser");
const cors = require("cors");
const routes = require("./routes/index");
require("dotenv").config();

const app = express();

app.use(bodyParser.json());
app.use(cors());
app.use(routes);

const PORT = process.env.PORT;

app.listen(PORT, () => {
  console.log(`App is running at ${PORT}`);
});
