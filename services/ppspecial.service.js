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

    getPpSpecial: (bdate, doctor, callBack) => {
        pool.query(
            `select (@cnt := @cnt + 1) AS pp_special_id,t.vn,t.smoking_id as pp_special_type_id,? as doctor,'1' as pp_special_service_place_type_id
            ,date_format(DATE_ADD(concat(t.vstdate,' ',t.vsttime), INTERVAL 10 MINUTE),'%Y-%m-%d %H:%i:%s') as entry_datetime,? as dest_hospcode,null as hos_guid,null as pp_special_text,t.hn FROM
            (select * FROM
            (select t.*,(select pp_special_type_id from pp_special_type WHERE pp_special_code = t.smoking) as smoking_id,vn.age_y 
            ,CASE WHEN t.vsttime < "08:00:00" THEN (select service5 from service_time s where s.vn = t.vn) 
            ELSE t.vsttime 
            END as vsttime2
            FROM
            (select op.vstdate,op.vsttime,op.vn,op.hn
            ,CASE 
                        WHEN smoking_type_id in('1','17') THEN '1B52'
                        WHEN smoking_type_id in('10') THEN '1B501'
                        WHEN smoking_type_id in('11') THEN '1B502'
                        WHEN smoking_type_id in('12','13') THEN '1B503'
                        WHEN smoking_type_id in('14') THEN '1B542'
                        WHEN smoking_type_id in('15','16') THEN '1B562'
                        end as smoking
             FROM opdscreen op
            WHERE  op.vstdate BETWEEN ? AND ?  AND vsttime BETWEEN "06:00:00" AND "18:00:00"
            AND (op.drinking_type_id is not null OR op.smoking_type_id is not null)
            AND op.hn not in         
            (select ps.hn from pp_special ps
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
             FROM opdscreen op
            WHERE  op.vstdate BETWEEN ? AND ?  AND vsttime BETWEEN "06:00:00" AND "18:00:00"
            AND (op.drinking_type_id is not null OR op.smoking_type_id is not null)
            AND op.hn not in         
            (select ps.hn from pp_special ps
                        INNER JOIN doctor d on d.code = ps.doctor
                        WHERE date(entry_datetime)> ?
                        AND pp_special_type_id in
                        (select pp_special_type_id from pp_special_type WHERE pp_special_code LIKE'1B5%' OR pp_special_code LIKE'1B6%')
                        AND hn is not NULL  
                        GROUP BY hn)
            
            ) t 
            LEFT JOIN vn_stat vn on vn.vn = t.vn
            WHERE vn.age_y >= 15  AND t.vstdate not in(select holiday_date from holiday)
            AND smoking is not null
            ORDER BY vstdate,vsttime asc)t
            
            
            
            UNION
            
            
             select * FROM
            (select t.*,(select pp_special_type_id from pp_special_type WHERE pp_special_code = t.drinking) as smoking_id,vn.age_y 
            ,CASE WHEN t.vsttime < "08:00:00" THEN (select service5 from service_time s where s.vn = t.vn) 
            ELSE t.vsttime 
            END as vsttime2
            FROM
            (select op.vstdate,op.vsttime,op.vn,op.hn
            ,CASE 
                        WHEN drinking_type_id in('1','14') THEN '1B600'
                        WHEN drinking_type_id in('11','12','13') THEN '1B601'
                        WHEN drinking_type_id in('7') THEN '1B602'
                        WHEN drinking_type_id in('8') THEN '1B603'
                        WHEN drinking_type_id in('9','10') THEN '1B604'
                        end as drinking
             FROM opdscreen op
            WHERE  op.vstdate BETWEEN ? AND ?  AND vsttime BETWEEN "06:00:00" AND "18:00:00"
            AND (op.drinking_type_id is not null OR op.smoking_type_id is not null)
            AND op.hn not in         
            (select ps.hn from pp_special ps
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
             FROM opdscreen op
            WHERE  op.vstdate BETWEEN ? AND ?  AND vsttime BETWEEN "06:00:00" AND "18:00:00"
            AND (op.drinking_type_id is not null OR op.smoking_type_id is not null)
            AND op.hn not in         
            (select ps.hn from pp_special ps
                        INNER JOIN doctor d on d.code = ps.doctor
                        WHERE date(entry_datetime)> ?
                        AND pp_special_type_id in
                        (select pp_special_type_id from pp_special_type WHERE pp_special_code LIKE'1B5%' OR pp_special_code LIKE'1B6%')
                        AND hn is not NULL  
                        GROUP BY hn)
            
            ) t 
            LEFT JOIN vn_stat vn on vn.vn = t.vn
            WHERE vn.age_y >= 15  AND t.vstdate not in(select holiday_date from holiday)
            AND drinking is not null
            ORDER BY vstdate,vsttime asc)t
         )t
            CROSS JOIN (SELECT @cnt := (select MAX(pp_special_id) FROM pp_special)) AS dummy order by t.vn asc`,
            [doctor, process.env.HOSPCODE, bdate, bdate, process.env.BEFOR_BYEAR, bdate, bdate, process.env.BEFOR_BYEAR, bdate, bdate, process.env.BEFOR_BYEAR, bdate, bdate, process.env.BEFOR_BYEAR],


            (error, results, fields) => {
                if (error) {
                    callBack(error);
                }
                return callBack(null, results);
            }
        );
    },


    getPpSpecial2: (bdate, doctor, callBack) => {
        pool.query(
            `select (@cnt := @cnt + 1) AS pp_special_id,t.vn,t.smoking_id as pp_special_type_id,? as doctor,'1' as pp_special_service_place_type_id
            ,date_format(DATE_ADD(concat(t.vstdate,' ',t.vsttime), INTERVAL 10 MINUTE),'%Y-%m-%d %H:%i:%s') as entry_datetime,? as dest_hospcode,null as hos_guid,null as pp_special_text,t.hn

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
                        WHERE op.vstdate BETWEEN ? AND ?
/*AND op.hnin(select patient_hn from person WHERE house_regist_type_id in(1,3) AND birthdate > "2004-01-01")*/
AND service5 BETWEEN "05:00:00" AND "18:00:00"
/*AND hn not in(select hn from hos_report.pp_specail_sukphapjit) */AND op.hnnot in (select ps.hnfrom pp_special ps
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
                        WHERE op.vstdate BETWEEN ? AND ?
/*AND op.hnin(select patient_hn from person WHERE house_regist_type_id in(1,3) AND birthdate > "2004-01-01")*/
AND service5 BETWEEN "05:00:00" AND "18:00:00"
/*AND hn not in(select hn from hos_report.pp_specail_sukphapjit) */AND op.hnnot in (select ps.hnfrom pp_special ps
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
                        WHERE op.vstdate BETWEEN ? AND ?
/*AND op.hnin(select patient_hn from person WHERE house_regist_type_id in(1,3) AND birthdate > "2004-01-01")*/
AND service5 BETWEEN "05:00:00" AND "18:00:00"
/*AND hn not in(select hn from hos_report.pp_specail_sukphapjit) */AND op.hnnot in (select ps.hnfrom pp_special ps
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
                        WHERE op.vstdate BETWEEN ? AND ?
/*AND op.hn in(select patient_hn from person WHERE house_regist_type_id in(1,3) AND birthdate > "2004-01-01")*/
AND service5 BETWEEN "05:00:00" AND "18:00:00"
/*AND hn not in(select hn from hos_report.pp_specail_sukphapjit) */AND op.hnnot in (select ps.hnfrom pp_special ps
                        INNER JOIN doctor d on d.code = ps.doctor
                        WHERE date(entry_datetime)> ?
                        AND pp_special_type_id in
                        (select pp_special_type_id from pp_special_type WHERE pp_special_code LIKE'1B5%' OR pp_special_code LIKE'1B6%')
                        AND hn is not NULL  
                        GROUP BY hn))t
LEFT JOIN pp_special_type pst on pst.pp_special_code = t.smoking
WHERE t.smoking is not null)

t
CROSS JOIN (SELECT @cnt := (select MAX(pp_special_id) FROM pp_special)) AS dummy 
WHERE t.hn in(select hn  FROM patient pt where pt.chwpart = ? AND pt.amppart = ? AND TIMESTAMPDIFF(YEAR,pt.birthday,?) >= 15)
order by t.vn asc`,
            [doctor, process.env.HOSPCODE, bdate, bdate, process.env.BEFOR_BYEAR, bdate, bdate, process.env.BEFOR_BYEAR, bdate, bdate, process.env.BEFOR_BYEAR, bdate, bdate, process.env.BEFOR_BYEAR,
                process.env.CHW_PART, process.env.AMP_PART, process.env.BYEAR
            ],


            (error, results, fields) => {
                if (error) {
                    callBack(error);
                }
                return callBack(null, results);
            }
        );
    },

    getDepress: (callBack) => {
        pool.query(
            `select (@cnt := @cnt + 1) AS pp_special_id,t.vn,pt.pp_special_type_id,t.doctorcode as doctor
            ,'1' as pp_special_service_place_type_id,date_format(t.screen_datetime,'%Y-%m-%d %H:%i:%s') as entry_datetime,? as dest_hospcode,null as hos_guid,null as pp_special_text,t.hn
             FROM
            (select ds.vn,ds.staff,o.doctorcode,ds.feel_boring_2_week,ds.feel_depression_2_week,ds.depression_score,vn.hn,ds.screen_datetime 
            ,CASE 
            WHEN (ds.feel_boring_2_week = 'Y' OR ds.feel_depression_2_week = 'Y') THEN '1B151'
            ELSE '1B150' end as depress_type
            
            from depression_screen ds
            LEFT JOIN vn_stat vn on vn.vn = ds.vn
            LEFT JOIN opduser o on o.loginname = ds.staff
            where date(ds.screen_datetime) > ?)t
            LEFT JOIN pp_special_type pt on pt.pp_special_code = t.depress_type
            CROSS JOIN (SELECT @cnt := (select MAX(pp_special_id) FROM pp_special)) AS dummy
            WHERE t.vn not in (select ps.vn from pp_special ps
            INNER JOIN doctor d on d.code = ps.doctor
            WHERE date(entry_datetime)> ?
            AND pp_special_type_id in
            (select pp_special_type_id from pp_special_type WHERE SUBSTR(pp_special_code,1,4) IN('1B15') )
            AND hn is not NULL  
            GROUP BY hn)
        
            /*
            AND vn.vn in(select vn from ovstdiag WHERE (SUBSTR(icd10,1,3) BETWEEN 'F11' AND 'F16' OR SUBSTR(icd10,1,3) BETWEEN 'F18' AND 'F19')
            AND diagtype IN(1)) */`,
            [process.env.HOSPCODE,process.env.BEFOR_BYEAR,process.env.BEFOR_BYEAR],
            (error, results, fields) => {
                if (error) {
                    callBack(error);
                }
                return callBack(null, results);
            }
        )
    },

    getAllSm: (bdate, callBack) => {
        pool.query(
            `select * FROM
         (select (@cnt := @cnt + 1) AS pp_special_id,t.vn,t.smoking_id as pp_special_type_id,(select (select doctorcode from opduser o where o.loginname = staff ) 
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
            LEFT JOIN pp_special_type pst on pst.pp_special_code = (t.smoking COLLATE utf8_unicode_ci)
            WHERE t.smoking is not null)
            
            t
            CROSS JOIN (SELECT @cnt := (select MAX(pp_special_id) FROM pp_special)) AS dummy 
            WHERE t.hn in(select hn  FROM patient pt where pt.chwpart = ? AND pt.amppart = ? AND TIMESTAMPDIFF(YEAR,pt.birthday,?) >= 15)
            order by pp_special_id,t.vn asc
            )t2
where t2.doctor is not NULL`,
            [bdate, process.env.HOSPCODE, bdate, process.env.BEFOR_BYEAR, bdate, process.env.BEFOR_BYEAR, bdate, process.env.BEFOR_BYEAR, bdate, process.env.BEFOR_BYEAR,
                process.env.CHW_PART, process.env.AMP_PART, process.env.BYEAR
            ],


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