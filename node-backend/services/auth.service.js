const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');
const db = require("../database/db");

exports.SignUp = async (name, email, password) => {
    const existingUser = await getUserByEmail(email);

    if (existingUser) {
      throw new Error('Email address is already registered');
    }
    
    const hashedPassword = await bcrypt.hash(password, 12);

    const sql = "INSERT INTO users (name, email, password) VALUES (?, ?, ?)";

    const values = [name, email, hashedPassword];

    const [result] = db.query(sql, values);
    
    return result;
};

exports.Login = async (email, password) => {

    const sql = "SELECT * FROM users WHERE email = ?";

    const [rows] = db.query(sql, email);

    if (!rows.length) {
        throw new Error("Invalid email or password");
    }

    const user = rows[0];

    const isPasswordValid = await bcrypt.compare(password, user.password);

    if (!isPasswordValid) {
        throw new Error("Invalid email or password");
    }

    const token = jwt.sign({ userId: user.id }, process.env.JWT_SECRET, {
        expiresIn: "1h",
    });

    return token;
};

const getUserByEmail = async (email) => {
    const sql = "SELECT * FROM users WHERE email = ?";

    const [rows] = db.query(sql, email);

    return rows[0];
};