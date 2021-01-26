const {
    getIptAdm,
    getPatient,
    getDataset12
} = require('../services/ipt.service');


module.exports = {
    getIptAdm: (req, res) => {
        const user = req.params.user;
        getIptAdm(user, (err, results) => {
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
    },
    getPatient: (req, res) => {
        const user = req.params.user;
        getPatient(user, (err, results) => {
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
    },
    getDataset12: (req, res) => {
        //const user = req.params.user;
        getDataset12( (err, results) => {
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

            return res.json({
                success: 1,
                data: results
            });
        });
    }
};