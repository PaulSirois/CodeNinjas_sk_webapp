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

/**
 * Adds a user to the new senseis table if they don't exist in the users table
 */
app.post('/admin/create-user', (req, res) => {
    const val = [req.body.username, req.body.role];

    const queryCheck = `SELECT name FROM users WHERE name = ?`
    const query = `INSERT INTO new_senseis (name, role) VALUES (?, ?) ON DUPLICATE KEY UPDATE role=VALUES(role)`;

    db.getConnection((err, connection) => {
        connection.query(queryCheck, [val[0]], (err, data) => {
            if (err) {
                console.error('Error checking for user in users:', err);
                res.json({status: 500, message: err});
            }
            if (data.length) {
                console.log('User already registered in users with name:', val[0]);
                res.json({status: 400, message: `User already registered with name: ${val[0]}`});
            } else {
                connection.query(query, val, (err, data) => {
                    if (err) {
                        console.error('Error inserting user:', err);
                        res.json({status: 500, message: 'Error creating user'});
                    } else {
                        res.json({status: 200, message: 'User created successfully by admin'});
                    }
                });
            }
            connection.release();
        });
    });
});

/**
 * Remove a user from the users and new senseis table table
 */
app.delete('/admin/delete-user', (req, res) => {
    const val = [req.body.username];

    const queryUsers = `DELETE FROM users WHERE name = ?`;
    const queryNewSenseis = `DELETE FROM new_senseis WHERE name = ?`;

    db.getConnection((err, connection) => {
        connection.query(queryUsers, val[0], (err, data) => {
            if (err) {
                console.error('Error deleting for user in users:', err);
                res.json({status: 500, message: err});
            } else {
                console.log('Removed user from users table', val[0]);
                res.json({status: 200, message: 'User removed successfully by admin from users table'});
            }
        }).then(
            connection.query(queryNewSenseis, val[0], (err, data) => {
                if (err) {
                    console.error('Error deleting for user in new_senseis:', err);
                    res.json({status: 500, message: err});
                } else {
                    console.log('Removed user from new_senseis table', val[0]);
                    res.json({status: 200, message: 'User removed successfully by admin from new_senseis table'});
                }
            }).then(
                connection.release()
            )
        );
    });
});

/**
 * Checks if sensei name is created and then adds the user if it exists, in the users table as a full user
 */
app.post('/signup-request', (req, res) => {
    const val = [req.body.username, req.body.password, req.body.role];

    const queryCheck = `SELECT * FROM new_senseis WHERE name = ?`;
    const query =
        `INSERT INTO users (id_bin, name, password, role) VALUES (UNHEX(REPLACE(UUID(),'-','')), ?, ?, ?)`;

    db.getConnection((err, connection) => {
        connection.query(queryCheck, [val[0]], (err, data) => {
            if (err) {
                console.error('Error checking for user in new_senseis:', err);
                res.json({status: 500, message: err});
            }
            if (!data.length) {
                console.log('No user in new_senseis with name:', val[0]);
                res.json({status: 400, message: `No user created with name: ${val[0]}`});
            } else {
                connection.query(query, val, (err, data) => {
                    if (err) {
                        console.error('Error inserting user into users:', err);
                        res.json({status: 500, message: err});
                    } else {
                        res.json({status: 200, message: 'User registered successfully!'});
                    }
                });
            }
            connection.release();
        });
    });
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