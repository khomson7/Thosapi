var express = require('express');
var router = express.Router();

const {
    createPpspecial,
    getPpSpecial,
    getPpSpecial2,
    getDepress,
    getAllSm,
    createPpSp,
    getUpdate
} = require('../controllers/ppspecial.controller');
const {
    checkToken2
} = require("../auth/jwt");


router.post("/", checkToken2, createPpspecial);
router.get('/test/:bdate/:doctor', checkToken2, getPpSpecial);
router.get('/ppspecials2/:bdate/:doctor',checkToken2, getPpSpecial2);
router.get('/depress', checkToken2, getDepress);
router.get('/allsm/:bdate',checkToken2,  getAllSm);
router.post('/ppspecial', checkToken2, createPpSp);
router.get('/updateserial', checkToken2,  getUpdate);

module.exports = router;