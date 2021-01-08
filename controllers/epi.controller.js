const { getEpiAll } = require("../services/epi.service");
module.exports = {
    getEpiAll: (req, res) => {
        const bdate = req.params.bdate;
        const edate = req.params.edate;
        getEpiAll(bdate,edate,(err, results) => {
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
    }
};