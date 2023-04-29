const Logout = async (req, res) => {
  try {
    res.clearCookie("token");
    return res.status(200).json({ message: "Logout successful" });
  } catch (error) {
    return res.status(401).send({ error });
  }
};

module.exports = {
  Logout,
};
