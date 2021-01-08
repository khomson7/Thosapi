var express = require('express');
var router = express.Router();
const { getEpiAll } = require('../controllers/epi.controller');


router.get('/epi/:bdate/:edate',getEpiAll);


module.exports = router;