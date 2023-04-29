const { Router } = require("express");
const routes = Router();

// Auth Controller
const SignUpController = require("../controllers/SignUp");
const LoginController = require("../controllers/Login");
const LogoutController = require("../controllers/Logout");
const GetUserDetails = require("../controllers/GetUserDetails");

// Auth Routes
routes.post("/signup", SignUpController.SignUp);
routes.post("/login", LoginController.Login);
routes.post("/logout", LogoutController.Logout);
routes.post("/:id/user", GetUserDetails.GetUserDetails);

module.exports = routes;
