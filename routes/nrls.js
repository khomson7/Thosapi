var express = require('express');
const { getOpvisit } = require('../controllers/nrls.controller');
var router = express.Router();





router.get('/opvisit',  getOpvisit);
module.exports = router;