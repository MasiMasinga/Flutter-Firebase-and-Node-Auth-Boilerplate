const functions = require("firebase-functions");
const admin = require("firebase-admin");
const express = require("express");
const cors = require("cors");

admin.initializeApp();

const app = express();
app.use(cors({ origin: true }));

app.post("/signup", (req, res) => {
  let user = {
    email: req.body.email,
    password: req.body.password,
  };

  if (!user.email) {
    return res.status(401).send({ message: "Email is required" });
  }

  if (!user.password) {
    return res.status(401).send({ message: "Password is required" });
  }

  admin
    .auth()
    .createUser(user)
    .then((userRecord) => {
      res
        .status(200)
        .json({ message: "User created successfully", user: userRecord });
    })
    .catch((error) => {
      console.error(error);
      res.status(500).json({ error: "Error occurred while creating user" });
    });
});

app.post("/login", async (req, res) => {

  try {
    const { email } = req.body;

    const userRecord = await admin.auth().getUserByEmail(email);
    const { uid } = await admin.auth().createCustomToken(userRecord.uid);
    return res.status(200).json({ token: uid });
  } catch (error) {
    return res.status(401).json({ message: "Unauthorized" });
  }
});

app.post("/logout", (req, res) => {
  const { uid } = req.body;

  admin
    .auth()
    .revokeRefreshTokens(uid)
    .then(() => {
      res.status(200).json({ message: "Logout successful" });
    })
    .catch((error) => {
      console.error(error);
      res.status(500).json({ error: "Error occurred while logging out user" });
    });
});

app.get("/user/:uid", (req, res) => {
  let user = {
    uid: req.params.uid,
  };

  admin
    .auth()
    .getUser(user)
    .then((userRecord) => {
      const user = userRecord.toJSON();
      res.status(200).json({ user });
    })
    .catch((error) => {
      console.error(error);
      res
        .status(500)
        .json({ error: "Error occurred while getting user details" });
    });
});

exports.api = functions.https.onRequest(app);
