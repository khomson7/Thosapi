const pool = require("../config/database");

module.exports = {

    getErLevel: (callBack) => {
        pool.query(`select 
        date_format(vstdate,'%Y-%m-%d') as vdate
        ,COUNT(CASE WHEN  er_emergency_level_id = 1 THEN vn END)  R
        ,COUNT(CASE WHEN  er_emergency_level_id = 2 THEN vn END)  E
        ,COUNT(CASE WHEN  er_emergency_level_id = 3 THEN vn END)  U
        ,COUNT(CASE WHEN  er_emergency_level_id = 4 THEN vn END)  SU
        ,COUNT(CASE WHEN  er_emergency_level_id = 5 THEN vn END)  N
        from er_regist
        WHERE TIMESTAMPDIFF(DAY,vstdate,NOW()) BETWEEN 0 AND 30
        GROUP BY vstdate
        ORDER BY vstdate ASC`,
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