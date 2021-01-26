var express = require('express');
var router = express.Router();
const { getErLevel } = require('../controllers/er.controller');




router.get('/',  getErLevel);


module.exports = router;