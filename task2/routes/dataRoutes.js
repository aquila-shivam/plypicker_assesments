const express = require('express');
const verifyToken = require('../middleware/verifyToken');
const dataController = require('../controllers/dataController');

const router = express.Router();

router.get('/', verifyToken, dataController.getData);

module.exports = router;
