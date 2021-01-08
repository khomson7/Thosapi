const pool = require('../config/database');

module.exports = {
    getIptAdm: (user, callBack) => {
        pool.query(` SELECT * FROM
        (SELECT concat(pt.fname,' ',pt.lname) as ptname,if(pt.sex ='1','ชาย','หญิง') as sex
        ,t.*,ia.bedno,ia.roomno,w.name as wname,r.name as rname FROM
        iptadm ia
        INNER JOIN
        (select an,concat(age_y,' ปี ',age_m,' เดือน ',age_d,' วัน') as age_y,hn,regdate,ward 
        from an_stat 
        WHERE   dchdate is NULL) t on t.an = ia.an
        LEFT JOIN patient pt on pt.hn = t.hn
        LEFT JOIN ward w on w.ward = t.ward
        LEFT JOIN roomno r on r.roomno = ia.roomno
        )t
        where t.ptname rlike ? 
        `,
            [user],
            (error, results, fields) => {
                if (error) {
                    callBack(error);
                }
                return callBack(null, results);
            }
        )
    },

    getPatient: (user, callBack) => {
        pool.query(`select t.*,concat(cnt_year,' ปี ',cnt_month,' เดือน ',cnt_day,' วัน') as age_y FROM 
        (SELECT pt.hn,concat(pt.fname,' ',pt.lname) as ptname,if(pt.sex ='1','ชาย','หญิง') as sex
        ,concat(DATE_FORMAT(birthday,'%d/%m/'),DATE_FORMAT(birthday,'%Y')+543) as birthday
        ,timestampdiff(year,pt.birthday,curdate()) as cnt_year,
        timestampdiff(month,pt.birthday,curdate())-(timestampdiff(year,pt.birthday,curdate())*12) as cnt_month,
        timestampdiff(day,date_add(pt.birthday,interval (timestampdiff(month,pt.birthday,curdate())) month),curdate()) as cnt_day
        ,concat(addrpart,' หมู่ ',moopart,' ',th.full_name) as full_name
        FROM patient pt 
        LEFT JOIN thaiaddress th on th.chwpart = pt.chwpart and th.amppart = pt.amppart AND th.tmbpart = pt.tmbpart) t
        where (t.hn rlike ? OR t.ptname rlike ?) LIMIT 100
        `,
            [user, user],
            (error, results, fields) => {
                if (error) {
                    callBack(error);
                }
                return callBack(null, results);
            }
        )
    },
};