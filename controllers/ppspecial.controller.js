const {
    createPpspecial,
    getPpSpecial,
    getPpSpecial2,
    getDepress,
    getAllSm,
    CreatePpSp,
    getUpdate,
    createPpspecialmonit

} = require('../services/ppspecial.service');

module.exports = {

    createPpspecial: (req, res) => {
        const body = req.body;
        // const salt = genSaltSync(10);
        // body.password = hashSync(body.password, salt);
        createPpspecial(body, (err, results) => {
            if (err) {
                console.log(err);
                return res.status(500).json({
                    success: 0,
                    message: "Database connection errror"
                });
            }
            return res.status(200).json({
                success: 1,
                data: results
            });
        });
    },

    createPpspecialmonit: (req, res) => {
        const body = req.body;
        createPpspecialmonit(body, (err, results) => {
            if (err) {
                console.log(err);
                return res.status(500).json({
                    success: 0,
                    message: "Database connection errror"
                });
            }
            return res.status(200).json({
                success: 1,
                data: results
            });
        });
    },
    getPpSpecial: (req, res) => {
        const bdate = req.params.bdate;
        //const edate = req.params.edate;
        const doctor = req.params.doctor;
        // const moo = req.params.moo;
        //const tmb = '01';
        getPpSpecial(bdate, doctor, (err, results) => {
            if (err) {
                console.log(err);
                return;
            }
            if (!results) {
                return res.json({
                    success: 0,
                    message: "Record not Found"
                });
            }
            // results.password = undefined;
            return res.json({
                success: 1,
                data: results
            });
        });
    },
    getPpSpecial2: (req, res) => {
        const bdate = req.params.bdate;
        //const edate = req.params.edate;
        const doctor = req.params.doctor;
        // const moo = req.params.moo;
        //const tmb = '01';
        getPpSpecial2(bdate, doctor, (err, results) => {
            if (err) {
                console.log(err);
                return;
            }
            if (!results) {
                return res.json({
                    success: 0,
                    message: "Record not Found"
                });
            }
            // results.password = undefined;
            return res.json({
                success: 1,
                data: results
            });
        });
    },

    getDepress: (req, res) => {
        getDepress((err, results) => {
            if (err) {
                console.log(err);
                return;
            }
            if (!results) {
                return res.json({
                    success: 0,
                    message: "Reccord not Found"
                });
            }
            return res.json({
                success: 1,
                data: results
            });

        });
    },

    getAllSm: (req, res) => {
        const hospcode = req.params.hospcode;
        const chwpart = req.params.chwpart;
        const amppart = req.params.amppart;
        const befor_byear = req.params.befor_byear;
        const byear = req.params.byear;
        const bdate = req.params.bdate;
        getAllSm( hospcode, chwpart, amppart, befor_byear, byear, bdate,  (err, results) => {
            if (err) {
                console.log(err);
                return;
            }
            if (!results) {
                return res.json({
                    success: 0,
                    message: "Record not Found"
                });
            }
            // results.password = undefined;
            return res.json({
                success: 1,
                data: results
            });
        });
    },
    createPpSp: (req, res) => {
        const body = req.body;
        CreatePpSp(body, (err, results) => {
            if (err) {
                console.log(err);
                return res.status(500).json({
                    success: 0,
                    message: "Database connection errror"
                });
            }
            return res.status(200).json({
                success: 1,
                data: results
            });
        });
    },
    getUpdate: (req, res) => {
        //const user = req.params.user;
        getUpdate((err, results) => {
            if (err) {
                console.log(err);
                return;
            }
            if (!results) {
                return res.json({
                    success: 0,
                    message: "Reccord Not Found"
                });
            }

            return res.json(
                results
            );
        });
    }

};