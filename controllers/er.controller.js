const {
    getErLevel
} = require('../services/er.service');

module.exports = {
    getErLevel: (req, res) => {
       // const cid = req.params.cid;
        getErLevel( (err, results) => {
            if (err) {
                console.log(err);
                return;
            }
            results.cid = undefined;

            return res.json( //{
                //    success: 1,
                results
            );
            // });
        });
    },
    getErLevel2: (req, res) => {
       // const cid = req.params.cid;
        getErLevel( (err, results) => {
            if (err) {
                console.log(err);
                return;
            }
            results.cid = undefined;

            return res.json({
                success: 1,
                data: results
            });
        });
    }


};