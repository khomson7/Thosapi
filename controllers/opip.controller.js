const {
  getOpVisit,
  getIpVisit,
  getOpClinic,
  getOpyear,
  getEnt
} = require("../services/opip.service");

module.exports = {
  getOpVisit: (req, res) => {

    getOpVisit((err, results) => {
      if (err) {
        console.log(err);
        return;
      }
      return res.json({
        success: 1,
        data: results
      });
    });
  },
  getIpVisit: (req, res) => {

    getIpVisit((err, results) => {
      if (err) {
        console.log(err);
        return;
      }
      return res.json({
        success: 1,
        data: results
      });
    });
  },
  getOpClinic: (req, res) => {

    getOpClinic((err, results) => {
      if (err) {
        console.log(err);
        return;
      }
      return res.json(results);
    });
  },
  getOpyear: (req, res) => {
    const year1 = req.params.year1;
    const year2 = req.params.year2;
    const year3 = req.params.year3;
    const year4 = req.params.year4;
    const year5 = req.params.year5;
    getOpyear(year1, year2, year3, year4, year5, (err, results) => {
      if (err) {
        console.log(err);
        return;
      }
      return res.json({
        success: 1,
        data: results
      });
    });
  },
  getEnt: (req, res) => {

    getEnt((err, results) => {
      if (err) {
        console.log(err);
        return;
      }
      return res.json({
        success: 1,
        data: results
      });
    });
  }
}