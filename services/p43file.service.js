const pool = require('../config/database');

module.exports = {

    createPpspecial: (data, callBack) => {
        pool.query(
            `replace into pp_special(pp_special_id, vn, pp_special_type_id, doctor, 
                pp_special_service_place_type_id, entry_datetime, dest_hospcode, hn) 
                      values(?,?,?,?,?,?,?,?)`,

            [
                data.pp_special_id,
                data.vn,
                data.pp_special_type_id,
                data.doctor,
                data.pp_special_service_place_type_id,
                data.entry_datetime,
                data.dest_hospcode,
                data.hn
            ],
            (error, results, fields) => {
                if (error) {
                    callBack(error);
                }
                return callBack(null, results);
            }
        );
    },

    getAllSm: (ym, callBack) => {
        pool.query(
            `select (@cnt := @cnt + 1) AS pp_special_id,t.vn,t.smoking_id as pp_special_type_id,(select (select doctorcode from opduser o where o.loginname = staff ) 
            from opdscreen_cc_history where vn = t.vn and vstdate = ?  GROUP BY vn) as doctor,'1' as pp_special_service_place_type_id
                        ,date_format(DATE_ADD(concat(t.vstdate,' ',t.vsttime), INTERVAL 10 MINUTE),'%Y-%m-%d %H:%i:%s') as entry_datetime,? as dest_hospcode,t.hn
            
             FROM
            
            (select t.*,pst.pp_special_type_id as smoking_id FROM
            (select op.vstdate,op.vsttime,op.vn,op.hn
            ,CASE 
                                    WHEN smoking_type_id in('1','17') THEN '1B52'
                                    WHEN smoking_type_id in('10') THEN '1B501'
                                    WHEN smoking_type_id in('11') THEN '1B502'
                                    WHEN smoking_type_id in('12','13') THEN '1B503'
                                    WHEN smoking_type_id in('14') THEN '1B542'
                                    WHEN smoking_type_id in('15','16') THEN '1B562'
                                    end as smoking 
                                    from opdscreen op 
                                    WHERE op.vstdate = ?
            AND op.hn not in (select ps.hn from pp_special ps
                                    INNER JOIN doctor d on d.code = ps.doctor
                                    WHERE date(entry_datetime)> ?
                                    AND pp_special_type_id in
                                    (select pp_special_type_id from pp_special_type WHERE pp_special_code LIKE'1B5%' OR pp_special_code LIKE'1B6%')
                                    AND hn is not NULL  
                                    GROUP BY hn)
            
            
            UNION
            
            select op.vstdate,op.vsttime,op.vn,op.hn
                                    ,CASE 
                                    WHEN smoking_type_id in('10') THEN '1B530'
                                    WHEN smoking_type_id in('11') THEN '1B531'
                                    WHEN smoking_type_id in('12','13') THEN '1B531'
                                    WHEN smoking_type_id in('14') THEN '1B531'
                                    WHEN smoking_type_id in('15','16') THEN '1B531'
                                    end as smoking
                                    from opdscreen op 
                                    WHERE op.vstdate = ?
            AND op.hn not in (select ps.hn from pp_special ps
                                    INNER JOIN doctor d on d.code = ps.doctor
                                    WHERE date(entry_datetime)> ?
                                    AND pp_special_type_id in
                                    (select pp_special_type_id from pp_special_type WHERE pp_special_code LIKE'1B5%' OR pp_special_code LIKE'1B6%')
                                    AND hn is not NULL  
                                    GROUP BY hn)
            
            
            UNION
            
            
            
            select op.vstdate,op.vsttime,op.vn,op.hn
            ,CASE 
                                    WHEN drinking_type_id in('1','14') THEN '1B600'
                                    WHEN drinking_type_id in('11','12','13') THEN '1B601'
                                    WHEN drinking_type_id in('7') THEN '1B602'
                                    WHEN drinking_type_id in('8') THEN '1B603'
                                    WHEN drinking_type_id in('9','10') THEN '1B604'
                                    end as drinking
                                    from opdscreen op 
                                    WHERE op.vstdate = ?
            AND op.hn not in (select ps.hn from pp_special ps
                                    INNER JOIN doctor d on d.code = ps.doctor
                                    WHERE date(entry_datetime)> ?
                                    AND pp_special_type_id in
                                    (select pp_special_type_id from pp_special_type WHERE pp_special_code LIKE'1B5%' OR pp_special_code LIKE'1B6%')
                                    AND hn is not NULL  
                                    GROUP BY hn)
            
                                    UNION
            
            select op.vstdate,op.vsttime,op.vn,op.hn
                            ,CASE 
                            WHEN drinking_type_id in('7') THEN '1B610'
                            WHEN drinking_type_id in('8') THEN '1B611'
                            WHEN drinking_type_id in('9','10') THEN '1B611'
                            end as drinking
                            from opdscreen op 
                            WHERE op.vstdate = ?
            AND op.hn not in (select ps.hn from pp_special ps
                                    INNER JOIN doctor d on d.code = ps.doctor
                                    WHERE date(entry_datetime)> ?
                                    AND pp_special_type_id in
                                    (select pp_special_type_id from pp_special_type WHERE pp_special_code LIKE'1B5%' OR pp_special_code LIKE'1B6%')
                                    AND hn is not NULL  
                                    GROUP BY hn)
            
            
            )t
            LEFT JOIN pp_special_type pst on pst.pp_special_code = t.smoking
            WHERE t.smoking is not null)
            
            t
            CROSS JOIN (SELECT @cnt := (select MAX(pp_special_id) FROM pp_special)) AS dummy 
            WHERE t.hn in(select hn  FROM patient pt where pt.chwpart = ? AND pt.amppart = ? AND TIMESTAMPDIFF(YEAR,pt.birthday,?) >= 15)
            AND (select (select doctorcode from opduser o where o.loginname = staff ) 
            from opdscreen_cc_history where vn = t.vn and vstdate = @bdate  GROUP BY vn) is not null
            order by pp_special_id,t.vn asc
`,
            [ym],


            (error, results, fields) => {
                if (error) {
                    callBack(error);
                }
                return callBack(null, results);
            }
        );
    },

    CreatePpSp: (data, callBack) => {
        pool.query(
            `REPLACE INTO pp_special(pp_special_id,vn,pp_special_type_id,doctor,pp_special_service_place_type_id,entry_datetime,dest_hospcode,hn)
                values(?,?,?,?,?,?,?,?)`,

            [
                data.pp_special_id,
                data.vn,
                data.pp_special_type_id,
                data.doctor,
                data.pp_special_service_place_type_id,
                data.entry_datetime,
                data.dest_hospcode,
                data.hn,  
               
            ],
            (error, results, fields) => {
                if (error) {
                    callBack(error);
                }
                return callBack(null, results)
            }
        );
    },
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
    }

}