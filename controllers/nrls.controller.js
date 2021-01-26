
const { getOpvisit } = require('../services/nrls.service');

module.exports = {
    
    getOpvisit: (req, res) => {
       // const cid = req.params.cid;
        getOpvisit( (err, results) => {
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