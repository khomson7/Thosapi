
var express = require('express');
var router = express.Router();


const {
    checkToken2
} = require("../auth/jwt");

const { getVisit, getClaim, getUserclaime, getClaimreport } = require('../controllers/claimcode.controller');

router.get('/visit/:cid', checkToken2 , getVisit);
router.get('/claim/:vn/:pttype', checkToken2 ,   getClaim);
router.get('/userclaim/:user',  checkToken2 ,  getUserclaime);
router.get('/claimreport/:bdate/:edate', checkToken2 , getClaimreport);
//router.get('/updateserial', checkToken2,  getUpdate);

module.exports = router;