var express = require('express');
var router = express.Router();

const {
    createPpspecial,
    getPpSpecial,
    getPpSpecial2,
    getDepress,
    getAllSm,
    createPpSp,
    getUpdate,
    createPpspecialmonit
} = require('../controllers/ppspecial.controller');
const {
    checkToken2
} = require("../auth/jwt");


router.post("/", checkToken2, createPpspecial);
router.get('/test/:bdate/:doctor', checkToken2, getPpSpecial);
router.get('/ppspecials2/:bdate/:doctor',checkToken2, getPpSpecial2);
router.get('/depress', checkToken2, getDepress);
router.get('/allsm/:hospcode/:chwpart/:amppart/:befor_byear/:byear/:bdate',  getAllSm);
router.post('/ppspecial', checkToken2, createPpSp);
router.get('/updateserial', checkToken2,  getUpdate);
router.post("/psmonit", checkToken2, createPpspecialmonit);

module.exports = router;