const pool = require("../config/database");

module.exports = {

    getOpvisit: (callBack) => {
        pool.query(`select t.* 
        ,(select visit FROM risk_nrls_dataset_rr003_6 where vstdate = t.vstdate AND rr_id = '3-5' ) as rr003
        ,(select pt FROM risk_nrls_dataset_rr003_6 where vstdate = t.vstdate AND rr_id = '3-5' ) as rr005
        ,(select visit FROM risk_nrls_dataset_rr003_6 where vstdate = t.vstdate AND rr_id = '4-6' ) as rr004
        ,(select pt FROM risk_nrls_dataset_rr003_6 where vstdate = t.vstdate AND rr_id = '4-6' ) as rr006
        FROM
        (select DATE_FORMAT(vstdate,'%Y-%m-%d') as vstdate 
        
        from risk_nrls_dataset_rr003_6)t
        where TIMESTAMPDIFF(MONTH,t.vstdate,NOW()) <= 3
        GROUP BY t.vstdate`,
            [],
            (error, results, fields) => {
                if (error) {
                    callBack(error);
                }
                return callBack(null, results);
            }
        );

    }

}