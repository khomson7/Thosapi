var express = require('express');
var router = express.Router();
const {
    checkToken2
} = require('../auth/jwt');
const { getReport1 } = require('../controllers/hos.controller');


router.get('/report1/:bdate/:edate',  getReport1);
module.exports = router;