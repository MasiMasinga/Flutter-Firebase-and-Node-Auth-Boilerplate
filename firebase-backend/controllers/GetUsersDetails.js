const { getAuth, getUserByE } = require("firebase/auth");

const GetUsersDetails = async (req, res) => {
  const auth = getAuth();
  const uid = req.params.id;

  try {
    const user = await getUser(auth, uid);
    return res.status(200).json({ user: user });
  } catch (error) {
    return res.status(500).json({ message: error.message });
  }
};

module.exports = {
  GetUsersDetails,
};
