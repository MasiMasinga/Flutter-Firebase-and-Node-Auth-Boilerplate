const { Router } = require("express");
const routes = Router();

// Firebase Auth Controller
const SignUpController = require("../controllers/SignUp");
const SignInController = require("../controllers/SignIn");
const GetUsersDetailsController = require("../controllers/GetUsersDetails");
const LogoutController = require("../controllers/Logout");

// Firebase Auth Routes
routes.post("/signup", SignUpController.SignUp);
routes.post("/signin", SignInController.SignIn);
routes.post("/logout", LogoutController.Logout);
routes.get("/user/:uid", GetUsersDetailsController.GetUsersDetails);

module.exports = routes;
