var express = require('express');
var router = express.Router();
const { getErLevel, getErLevel2 } = require('../controllers/er.controller');




router.get('/',  getErLevel);
router.get('/er2',  getErLevel2);


module.exports = router;