/* env */
require('dotenv').config();

/* express */
const express = require("express");
const app = express();

/* parse */
app.use(express.json());

/* cors */
const cors = require("cors");
app.use(cors());

/* database */
const mysql = require("mysql2");

/* jwt */
const jwt = require("jsonwebtoken");

const db = mysql.createPool({
    host: "localhost",
    user: "root",
    password: "admin",
    database: "cnSkNinjas",
    port: 3306,
});


app.post('/login-request', (req, res) => {
    const val = [req.body.username, req.body.password];

    const query =
        `SELECT name, id_text, role FROM users WHERE name = ? AND password = ?`;

    db.getConnection((err, connection) => {
        connection.query(query, val, (err, data) => {
            connection.release();
            if (err) return res.json({status: 500});
            if (data.length === 0) {
                return res.json({status: 400, message: "Incorrect username or password"});
            } else {
                const accessToken = jwt.sign(
                    {username: data[0].name, id: data[0].id_text, role: data[0].role},
                    process.env.ACCESS_TOKEN_SECRET,
                    {expiresIn: '3h'}
                );
                return res.json({status: 200, accessToken: accessToken});
            }
        });
    });
});

// TODO: Create new ninjas method
