
var express = require('express');
var router = express.Router();


const {
    checkToken2
} = require("../auth/jwt");

const { getVisit, getClaim } = require('../controllers/claimcode.controller');

router.get('/visit/:cid', checkToken2 , getVisit);
router.get('/claim/:vn/:pttype',   getClaim);
//router.get('/updateserial', checkToken2,  getUpdate);

module.exports = router;