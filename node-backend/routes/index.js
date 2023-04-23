const express = require("express");
const router = express.Router();

// Auth Controller
const SignUpController = require("../controllers/SignUp");
const LoginController = require("../controllers/Login");
const LogoutController = require("../controllers/Logout");

// Auth Routes
router.post("/signup", SignUpController.SignUp);
router.post("/login", LoginController.Login);
router.post("/logout", LogoutController.Logout);

module.exports = router;
