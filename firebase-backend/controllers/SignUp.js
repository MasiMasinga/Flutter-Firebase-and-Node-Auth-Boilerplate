const {
    getAuth,
    createUserWithEmailAndPassword
} = require("firebase/auth");

const SignUp = async (req, res) => {

    const { email, password } = req.body;

    if (!email) {
        return res.status(400).json({ message: "Email is required" });
    }

    if (!password) {
        return res.status(400).json({ message: "Password is required" });
    }

    try {
        const auth = getAuth();
        const user = await createUserWithEmailAndPassword(auth, email, password);
        const token = await user.user.getIdToken();
        return res.status(200).json({ message: 'User Created', token: token, user: user });
    } catch (error) {
        return res.status(500).json({ message: error.message });
    }

}

module.exports = { SignUp };