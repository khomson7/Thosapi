var express = require('express');
var router = express.Router();
const {
    checkToken2
} = require('../auth/jwt');
const {
    getIptAdm,
    getPatient
} = require('../controllers/ipt.controller');

router.get('/:user', checkToken2, getIptAdm);
router.get('/patient/:user', checkToken2, getPatient);

module.exports = router;