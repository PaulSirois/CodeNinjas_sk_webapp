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

/*
*
* */

// TODO: Create new ninjas method