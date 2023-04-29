// Logout User
const { signOut } = require("firebase/auth");

const { auth } = require("../config/firebase");

const Logout = async (req, res) => {
  const { token } = req.body;

  if (!token) {
    return res.status(400).json({ message: "Token is required" });
  }

  try {
    await signOut(auth);
    return res.status(200).json({ message: "User Logged Out" });
  } catch (error) {
    return res.status(500).json({ message: error.message });
  }
};

module.exports = { Logout };
