const {
    getWsEpi,
    getWsPerson,
    getWsAnc
} = require('../services/f43export.service');

module.exports = {
    getWsEpi: (req, res) => {
        getWsEpi((err, results) => {
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
    },
    getWsPerson: (req, res) => {
        getWsPerson((err, results) => {
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
    },
    getWsAnc: (req, res) => {
        getWsAnc((err, results) => {
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