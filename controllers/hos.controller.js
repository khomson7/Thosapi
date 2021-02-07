const { getReport1 } = require("../services/hos.service");
module.exports = {

    getReport1: (req, res) => {
        const bdate = req.params.bdate;
        const edate = req.params.edate;
        getReport1(bdate, edate , (err, results) => {
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
            
            return res.json(
               results);
        });
    }

};