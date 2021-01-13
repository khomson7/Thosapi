const pool = require('../config/database');

module.exports = {

    getVisit: (cid, callBack) => {
        pool.query(
            `select v.vn,concat(date_format(vn.vstdate,'%d/%m/'),date_format(vn.vstdate,'%Y')+543) as vstdate,date_format(vn.vstdate,'%Y-%m-%d') as vstdate2,pt.cid,concat(pt.pname,pt.fname,' ',pt.lname) as ptname
            ,v.pttype
            ,(SELECT name from pttype where pttype = v.pttype) as pttname
            from visit_pttype v
            INNER JOIN vn_stat vn on vn.vn = v.vn
            INNER JOIN patient pt on pt.hn = vn.hn
            where pt.cid = ? AND vn.vstdate = date(NOW())
            ORDER BY vn ASC
            limit 1`,
            [cid],


            (error, results, fields) => {
                if (error) {
                    callBack(error);
                }
                return callBack(null, results);
            }
        );
    },
    getClaim: (vn,pttype, callBack) => {
        pool.query(
            `select v.vn,v.claim_code,v.pttype,vn.vstdate,pt.cid,concat(pt.pname,pt.fname,' ',pt.lname) as ptname 
            ,(SELECT name from pttype where pttype = v.pttype) as pttname
            from visit_pttype v
            INNER JOIN vn_stat vn on vn.vn = v.vn
            INNER JOIN patient pt on pt.hn = vn.hn
            where v.vn = ? AND v.pttype = ?
            ORDER BY vn ASC limit 1`,
            [vn,pttype],


            (error, results, fields) => {
                if (error) {
                    callBack(error);
                }
                return callBack(null, results);
            }
        );
    },
/*
    getUpdate: (callBack) => {
        pool.query(`update serial 
        SET serial_no = (select max(pp_special_id) FROM pp_special)
         WHERE name = 'pp_special_id'
        `,
            [],
            (error, results, fields) => {
                if (error) {
                    callBack(error);
                }
                return callBack(null, results);
            }
        )
    } */

}