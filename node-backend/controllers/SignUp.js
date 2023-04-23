const authService = require("../services/auth.service");

exports.SignUp = async (req, res, next) => {
  try {

    let user = {
      name: req.body.name,
      email: req.body.email,
      password: req.body.password,
    };

    if (!user.name) {
      return res.status(401).send({ message: "Last Name is required" });
    }

    if (!user.email) {
      return res.status(401).send({ message: "Email is required" });
    }

    if (!user.password) {
      return res.status(401).send({ message: "Password is required" });
    }

    if (user.password.length < 6) {
      return res.status(400).send(`Please Enter Password with 6 minimum characters`);
    }

    const userData = await  authService.SignUp(user);

    res.status(201).json({ message: "User created successfully", userData });
  } catch (err) {
    next(err);
  }
};
