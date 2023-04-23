const authService = require('../services/auth.service');

exports.Login = async (req, res, next) => {
  try {

    let user = {
        email: req.body.email,
        password: req.body.password
    }

    if (!user.email) {
        return res.status(401).send({ message: "Email is required" });
      }
  
    if (!user.password) {
        return res.status(401).send({ message: "Password is required" });
    }
  
    if (user.password.length < 6) {
        return res.status(400).send({ message: "Password must be at least 6 characters" });
    }

    const userData = await authService.Login(user);
    res.status(200).json({ userData });
  } catch (err) {
    next(err);
  }
};


