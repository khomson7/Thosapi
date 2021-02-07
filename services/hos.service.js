const pool2 = require('../config/database2');

module.exports = {

    getReport1: (bdate,edate, callBack) => {
        pool2.query(
            `select p.*,concat(date_format(entry_datetime,'%d/%m/'),date_format(entry_datetime,'%Y')+543,' ',date_format(entry_datetime,'%H:%i:%s')) as tdate from pp_special_monit p where date(entry_datetime) BETWEEN ? AND ? `,
            [bdate,edate],


            (error, results, fields) => {
                if (error) {
                    callBack(error);
                }
                return callBack(null, results);
            }
        );
    },



}