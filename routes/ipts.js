var express = require('express');
var router = express.Router();
const {
    checkToken2
} = require('../auth/jwt');
const {
    getIptAdm,
    getPatient,
    getDataset12
} = require('../controllers/ipt.controller');

router.get('/:user', checkToken2, getIptAdm);
router.get('/patient/:user', checkToken2, getPatient);
router.get('/nrls/dataset',  getDataset12);

module.exports = router;