const authService = require("../services/auth.service");

exports.Logout = (req, res) => {
  res.clearCookie("jwt");
  res.status(200).json({ message: "Successfully logged out" });
};
