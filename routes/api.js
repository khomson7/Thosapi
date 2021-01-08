var express = require('express');
var router = express.Router();
const {
    getOpVisit,
    getIpVisit,
    getOpClinic,
    getOpyear,
    getEnt

} = require("../controllers/opip.controller");



router.get("/opip/opvisit", getOpVisit);
router.get("/opip/ipvisit", getIpVisit);
router.get("/opip/opclinic", getOpClinic);
router.get("/opip/opyear/:year1/:year2/:year3/:year4/:year5", getOpyear);
router.get("/opip/ent", getEnt);
module.exports = router;