const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();
const bcrypt = require("bcrypt");
const dotenv = require("dotenv");
dotenv.config();

const SignUp = async (req, res) => {

    try {
      let data = {
        name: req.body.name,
        email: req.body.email,
        password: req.body.password,
      };
  
      if (!data.name) {
        return res.status(401).send({ message: "Name is required" });
      }
  
      if (!data.email) {
        return res.status(401).send({ message: "Email is required" });
      }
  
      if (!data.password) {
        return res.status(401).send({ message: "Password is required" });
      }
  
      if (data.password.length < 6) {
        return res.status(401).send(`Please Enter Password with 6 minimum characters`);
      }
  
      const salt = await bcrypt.genSalt(10);
      const hashedPassword = await bcrypt.hash(data.password, salt);
  
      const newUser = await prisma.user.create({
        data: {
          name: data.name,
          email: data.email,
          password:hashedPassword,
        },
      });
  
      return res.status(200).send({ message: "User created successfully" , user: newUser });
    } catch (error) {
      return res.status(401).send({ error });
    }
};

module.exports = {
  SignUp,
};
