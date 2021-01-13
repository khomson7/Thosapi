const { getVisit, getClaim } = require("../services/claimcode.service");

module.exports = {

    getVisit: (req, res) => {
        const cid = req.params.cid;
      //  const doctor = req.params.doctor;
        getVisit(cid,  (err, results) => {
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
            return res.json(results);
        });
    },
    getClaim: (req, res) => {
        const vn = req.params.vn;
        const pttype = req.params.pttype;
      //  const doctor = req.params.doctor;
        getClaim(vn, pttype , (err, results) => {
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
                results
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