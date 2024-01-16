/**********
* IMPORTS *
***********/
require('dotenv').config(); // allow .env file
const express = require("express");
const app = express(); // instantiate express app
app.use(express.json()); // use json format
const cors = require("cors"); // cross-origin resource sharing
app.use(cors()); // use cors
const mysql = require("mysql2");
const jwt = require("jsonwebtoken");

/*******************************
* DATABASE AND TEST CONNECTION *
********************************/

const db = mysql.createPool({
    host: "localhost",
    user: "root",
    password: "admin",
    database: "cnSkNinjas",
    port: 3306,
});

db.getConnection((err, connection) => {
    if (err) return console.log(err);
    console.log("Test connection to DB successful!");
    connection.release();
});

/*******************
* LOGIN AND SIGNUP *
********************/

app.post('/signup-request', (req, res) => {
    const val = [req.body.username, req.body.password];

    const query =
        `INSERT INTO users (id_bin, name, password) VALUES (UNHEX(REPLACE(UUID(),'-','')), ?, ?)`;

    db.getConnection((err, connection) => {
        connection.query(query, (err, data) => {
            connection.release();
            if (err) {
                if (err.code === 'ER_DUP_ENTRY') { // Duplicate entry error (username already exists)
                    res.json({status: 400, message: 'Username already taken'});
                } else {
                    console.error('Error inserting user:', err);
                    res.json({status: 500, message: 'Error registering user'});
                }
            } else {
                res.json({status: 201, message: 'User registered successfully'});
            }
        });
    });
});

app.post('/admin/createUser',(req, res) => {

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
                return res.json({status: 201, accessToken: accessToken});
            }
        });
    });
});

// ************************************************************************* END OF LOGIN AND SIGNUP

// TODO: Create new ninjas method
