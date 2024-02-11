const jwt = require('jsonwebtoken');
const User = require('../models/User.js');

const JWT_SECRET = 'helloworld';

exports.register = (req, res) => {
    // Logic for user registration
    // For simplicity, let's assume registration is successful
    const { email, password } = req.body;

    if (User.findUserByEmail(email)) {
        return res.status(400).json({ message: 'User already exists' });
    }

    // Create a new user
    const newUser = User.createUser(email, password); // Password should be hashed in production

    res.status(200).json({ message: 'User registered successfully' });
};

exports.login = (req, res) => {
    // Logic for user authentication
    // For simplicity, let's assume authentication is successful and return a JWT token
    const { email, password } = req.body;

    // Find the user
    const user = User.findUserByEmail(email);

    // Check if the user exists and password matches
    if (!user || user.password !== password) { // Password should be compared securely in production
        return res.status(401).json({ message: 'Invalid email or password' });
    }

    const token = jwt.sign({ username: req.body.username }, JWT_SECRET,{ expiresIn: '1h' });
    res.status(200).json({ token: token });
};
