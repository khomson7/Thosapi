const pool = require('../config/database');

module.exports = {

    getVisit: (cid, callBack) => {
        pool.query(
            `select v.vn,concat(date_format(vn.vstdate,'%d/%m/'),date_format(vn.vstdate,'%Y')+543) as vstdate,date_format(vn.vstdate,'%Y-%m-%d') as vstdate2,pt.cid,concat(pt.pname,pt.fname,' ',pt.lname) as ptname
            ,v.pttype,vn.hn
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
    getUserclaim: (user, callBack) => {
        pool.query(
            `select v.vn,v.claim_code,IFNULL((select concat(hosptype,name) from hospcode where hospcode = vn.hospmain),'-') as hosmain
            ,vn.hospsub
            ,v.pttype,concat(date_format(vn.vstdate,'%d/%m/'),date_format(vn.vstdate,'%Y')+543) as vstdate2,pt.cid,concat(pt.pname,pt.fname,' ',pt.lname) as ptname 
            ,v.staff
                        ,(SELECT name from pttype where pttype = v.pttype) as pttname
                        from visit_pttype v
                        INNER JOIN vn_stat vn on vn.vn = v.vn
                        INNER JOIN patient pt on pt.hn = vn.hn
                        where vn.vstdate = date(NOW()) AND  (claim_code not in('') and claim_code is not NULL) 
                                    AND staff = ?
                                    ORDER BY vn DESC `,
            [user],


            (error, results, fields) => {
                if (error) {
                    callBack(error);
                }
                return callBack(null, results);
            }
        );
    },
    getClaimreport: (bdate,edate, callBack) => {
        pool.query(
            `select v.vn,v.claim_code,IFNULL((select concat(hosptype,name) from hospcode where hospcode = vn.hospmain),'-') as hosmain
            ,IFNULL((select province_name from hospcode where hospcode = vn.hospmain),'-') as province,vn.hn
                        ,vn.hospsub
                        ,v.pttype,concat(date_format(vn.vstdate,'%d/%m/'),date_format(vn.vstdate,'%Y')+543) as vstdate2,pt.cid,concat(pt.pname,pt.fname,' ',pt.lname) as ptname 
                        ,v.staff
                                    ,(SELECT name from pttype where pttype = v.pttype) as pttname
                                    from visit_pttype v
                                    INNER JOIN vn_stat vn on vn.vn = v.vn
                                    INNER JOIN patient pt on pt.hn = vn.hn
                                    where vn.vstdate BETWEEN ? AND ? AND  (claim_code not in('') and claim_code is not NULL)     
                                    ORDER BY vn DESC`,
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