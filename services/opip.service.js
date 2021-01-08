const pool = require("../config/database");
const pool4 = require("../config/database4");
module.exports = {

  getOpVisit: callBack => {

    pool.query(
      `select date_format(vstdate,'%Y-%m-%d') as vstdate,pt_count,visit_count
      from tbl_visit_now
      WHERE vstdate between date(DATE_ADD(NOW(), INTERVAL -31 DAY))  AND date(NOW())
      GROUP BY date_format(vstdate,'%Y-%m-%d') asc
          `,
      [],
      (error, results, fields) => {
        if (error) {
          callBack(error);
        }

        return callBack(null, results);
      }
    );
  },
  getIpVisit: callBack => {

    pool4.query(
      `select date_format(jj,'%Y-%m-%d') as ddate,sum(sumpiset) as sumpiset,sum(sumsamun) as sumsamun
          from tbl_admiss_now
          WHERE jj between date(DATE_ADD(NOW(), INTERVAL -31 DAY))  AND date(DATE_ADD(NOW(), INTERVAL -1 DAY))
          GROUP BY date_format(jj,'%Y-%m-%d') asc
          `,
      [],
      (error, results, fields) => {
        if (error) {
          callBack(error);
        }

        return callBack(null, results);
      }
    );
  },
  getOpClinic: callBack => {

    pool4.query(
      `select concat(date_format(t2.vstdate,'%d/%m/'),date_format(t2.vstdate,'%Y')+543) as 'วันที่รับบริการ'
      ,sum(CASE WHEN t2.depcode_group = '001' THEN visit end) as 'คลินิกเฉพาะโรค'
      ,sum(CASE WHEN t2.depcode_group = '002' THEN visit end) as 'ห้องตรวจโรคจิตเวช'
      ,sum(CASE WHEN t2.depcode_group = '003' THEN visit end) as 'ฝ่ายส่งเสริมสุขภาพ'
      ,sum(CASE WHEN t2.depcode_group = '004' THEN visit end) as 'คลินิกโรคทั่วไป'
      ,sum(CASE WHEN t2.depcode_group = '005' THEN visit end) as 'ห้องหัตถการ'
      ,sum(CASE WHEN t2.depcode_group = '006' THEN visit end) as 'คลินิกเด็ก'
      ,sum(CASE WHEN t2.depcode_group = '007' THEN visit end) as 'คลินิกศัลยกรรมกระดูก'
      ,sum(CASE WHEN t2.depcode_group = '008' THEN visit end) as 'ห้องตรวจอายุรกรรม'
      ,sum(CASE WHEN t2.depcode_group = '009' THEN visit end) as 'ห้องตรวจตา'
      ,sum(CASE WHEN t2.depcode_group = '010' THEN visit end) as 'แพทย์แผนไทย'
      ,sum(CASE WHEN t2.depcode_group = '011' THEN visit end) as 'กายภาพ'
      
      ,sum(CASE WHEN t2.depcode_group = '013' THEN visit end) as 'คลินิกเวชกรรมฟื้นฟู'
      ,sum(CASE WHEN t2.depcode_group = '014' THEN visit end) as 'หน่วยไตเทียม'
      ,sum(CASE WHEN t2.depcode_group = '015' THEN visit end) as 'ห้องตรวจกระตุ้นพัฒนาการเด็ก'
      ,sum(CASE WHEN t2.depcode_group = '016' THEN visit end) as 'ห้องอุบัติเหตุฉุกเฉิน (ER)'
      ,sum(CASE WHEN t2.depcode_group = '017' THEN visit end) as 'โสต ศอ นาสิก'
      ,sum(CASE WHEN t2.depcode_group = '019' THEN visit end) as 'งานCAPD'
      ,sum(CASE WHEN t2.depcode_group = '021' THEN visit end) as 'ศัลยกรรม'
      
       from
      (select vstdate,t1.depcode_group,visit,department_group_name
      FROM
      (SELECT ts.*,k.depcode_group 
      from hos_report.tmp_service_time ts
      INNER JOIN hos_report.kskdepartment k on k.depcode = ts.service4_dep)t1
      INNER JOIN hos_report.kskdepartment_group kg on kg.depcode_group = t1.depcode_group
      WHERE t1.vstdate BETWEEN date(DATE_ADD(NOW(), INTERVAL -31 DAY))  AND date(DATE_ADD(NOW(), INTERVAL -1 DAY)))t2
      GROUP BY t2.vstdate order by t2.vstdate desc
          `,
      [],
      (error, results, fields) => {
        if (error) {
          callBack(error);
        }

        return callBack(null, results);
      }
    );
  },
  getOpyear: (year1, year2, year3, year4, year5, callBack) => {

    pool4.query(
      `select 'ต.ค.' as ymonth
      ,(select m10 as y
      from hosreport_count_opvisit
      WHERE tb = 'OPVISIT' AND b_year = ?) y1,(select m10 as y
      from hosreport_count_opvisit
      WHERE tb = 'OPVISIT' AND b_year = ?)y2,(select m10 as y
      from hosreport_count_opvisit
      WHERE tb = 'OPVISIT' AND b_year = ?)y3,(select m10 as y
      from hosreport_count_opvisit
      WHERE tb = 'OPVISIT' AND b_year = ?)y4,(select m10 as y
      from hosreport_count_opvisit
      WHERE tb = 'OPVISIT' AND b_year = ?)y5
      
      UNION
      
      select 'พ.ย.' as ymonth
      ,(select m11 as y
      from hosreport_count_opvisit
      WHERE tb = 'OPVISIT' AND b_year = ?) y1,(select m11 as y
      from hosreport_count_opvisit
      WHERE tb = 'OPVISIT' AND b_year = ?)y2,(select m11 as y
      from hosreport_count_opvisit
      WHERE tb = 'OPVISIT' AND b_year = ?)y3,(select m11 as y
      from hosreport_count_opvisit
      WHERE tb = 'OPVISIT' AND b_year = ?)y4,(select m11 as y
      from hosreport_count_opvisit
      WHERE tb = 'OPVISIT' AND b_year = ?)y5
      
      UNION
      
      select 'ธ.ค.' as ymonth
      ,(select m12 as y
      from hosreport_count_opvisit
      WHERE tb = 'OPVISIT' AND b_year = ?) y1,(select m12 as y
      from hosreport_count_opvisit
      WHERE tb = 'OPVISIT' AND b_year = ?)y2,(select m12 as y
      from hosreport_count_opvisit
      WHERE tb = 'OPVISIT' AND b_year = ?)y3,(select m12 as y
      from hosreport_count_opvisit
      WHERE tb = 'OPVISIT' AND b_year = ?)y4,(select m12 as y
      from hosreport_count_opvisit
      WHERE tb = 'OPVISIT' AND b_year = ?)y5
      
      UNION
      
      select 'ม.ค.' as ymonth
      ,(select m01 as y
      from hosreport_count_opvisit
      WHERE tb = 'OPVISIT' AND b_year = ?) y1,(select m01 as y
      from hosreport_count_opvisit
      WHERE tb = 'OPVISIT' AND b_year = ?)y2,(select m01 as y
      from hosreport_count_opvisit
      WHERE tb = 'OPVISIT' AND b_year = ?)y3,(select m01 as y
      from hosreport_count_opvisit
      WHERE tb = 'OPVISIT' AND b_year = ?)y4,(select m01 as y
      from hosreport_count_opvisit
      WHERE tb = 'OPVISIT' AND b_year = ?)y5
	  
      
      UNION
      
      select 'ก.พ.' as ymonth
      ,(select m02 as y
      from hosreport_count_opvisit
      WHERE tb = 'OPVISIT' AND b_year = ?) y1,(select m02 as y
      from hosreport_count_opvisit
      WHERE tb = 'OPVISIT' AND b_year = ?)y2,(select m02 as y
      from hosreport_count_opvisit
      WHERE tb = 'OPVISIT' AND b_year = ?)y3,(select m02 as y
      from hosreport_count_opvisit
      WHERE tb = 'OPVISIT' AND b_year = ?)y4,(select m02 as y
      from hosreport_count_opvisit
      WHERE tb = 'OPVISIT' AND b_year = ?)y5
      
      UNION
      
      select 'มี.ค.' as ymonth
      ,(select m03 as y
      from hosreport_count_opvisit
      WHERE tb = 'OPVISIT' AND b_year = ?) y1,(select m03 as y
      from hosreport_count_opvisit
      WHERE tb = 'OPVISIT' AND b_year = ?)y2,(select m03 as y
      from hosreport_count_opvisit
      WHERE tb = 'OPVISIT' AND b_year = ?)y3,(select m03 as y
      from hosreport_count_opvisit
      WHERE tb = 'OPVISIT' AND b_year = ?)y4,(select m03 as y
      from hosreport_count_opvisit
      WHERE tb = 'OPVISIT' AND b_year = ?)y5
      
      UNION
      
      select 'เม.ย.' as ymonth
      ,(select m04 as y
      from hosreport_count_opvisit
      WHERE tb = 'OPVISIT' AND b_year = ?) y1,(select m04 as y
      from hosreport_count_opvisit
      WHERE tb = 'OPVISIT' AND b_year = ?)y2,(select m04 as y
      from hosreport_count_opvisit
      WHERE tb = 'OPVISIT' AND b_year = ?)y3,(select m04 as y
      from hosreport_count_opvisit
      WHERE tb = 'OPVISIT' AND b_year = ?)y4,(select m04 as y
      from hosreport_count_opvisit
      WHERE tb = 'OPVISIT' AND b_year = ?)y5
      
      UNION
      
      select 'พ.ค.' as ymonth
      ,(select m05 as y
      from hosreport_count_opvisit
      WHERE tb = 'OPVISIT' AND b_year = ?) y1,(select m05 as y
      from hosreport_count_opvisit
      WHERE tb = 'OPVISIT' AND b_year = ?)y2,(select m05 as y
      from hosreport_count_opvisit
      WHERE tb = 'OPVISIT' AND b_year = ?)y3,(select m05 as y
      from hosreport_count_opvisit
      WHERE tb = 'OPVISIT' AND b_year = ?)y4,(select m05 as y
      from hosreport_count_opvisit
      WHERE tb = 'OPVISIT' AND b_year = ?)y5
      
      UNION
      
      select 'มิ.ย.' as ymonth
      ,(select m06 as y
      from hosreport_count_opvisit
      WHERE tb = 'OPVISIT' AND b_year = ?) y1,(select m06 as y
      from hosreport_count_opvisit
      WHERE tb = 'OPVISIT' AND b_year = ?)y2,(select m06 as y
      from hosreport_count_opvisit
      WHERE tb = 'OPVISIT' AND b_year = ?)y3,(select m06 as y
      from hosreport_count_opvisit
      WHERE tb = 'OPVISIT' AND b_year = ?)y4,(select m06 as y
      from hosreport_count_opvisit
      WHERE tb = 'OPVISIT' AND b_year = ?)y5
      
      UNION
      
      select 'ก.ค.' as ymonth
      ,(select m07 as y
      from hosreport_count_opvisit
      WHERE tb = 'OPVISIT' AND b_year = ?) y1,(select m07 as y
      from hosreport_count_opvisit
      WHERE tb = 'OPVISIT' AND b_year = ?)y2,(select m07 as y
      from hosreport_count_opvisit
      WHERE tb = 'OPVISIT' AND b_year = ?)y3,(select m07 as y
      from hosreport_count_opvisit
      WHERE tb = 'OPVISIT' AND b_year = ?)y4,(select m07 as y
      from hosreport_count_opvisit
      WHERE tb = 'OPVISIT' AND b_year = ?)y5
      
      UNION
      
      select 'ส.ค.' as ymonth
      ,(select m08 as y
      from hosreport_count_opvisit
      WHERE tb = 'OPVISIT' AND b_year = ?) y1,(select m08 as y
      from hosreport_count_opvisit
      WHERE tb = 'OPVISIT' AND b_year = ?)y2,(select m08 as y
      from hosreport_count_opvisit
      WHERE tb = 'OPVISIT' AND b_year = ?)y3,(select m08 as y
      from hosreport_count_opvisit
      WHERE tb = 'OPVISIT' AND b_year = ?)y4,(select m08 as y
      from hosreport_count_opvisit
      WHERE tb = 'OPVISIT' AND b_year = ?)y5
      
      UNION
      
      select 'ก.ย.' as ymonth
      ,(select m09 as y
      from hosreport_count_opvisit
      WHERE tb = 'OPVISIT' AND b_year = ?) y1,(select m09 as y
      from hosreport_count_opvisit
      WHERE tb = 'OPVISIT' AND b_year = ?)y2,(select m09 as y
      from hosreport_count_opvisit
      WHERE tb = 'OPVISIT' AND b_year = ?)y3,(select m09 as y
      from hosreport_count_opvisit
      WHERE tb = 'OPVISIT' AND b_year = ?)y4,(select m09 as y
      from hosreport_count_opvisit
      WHERE tb = 'OPVISIT' AND b_year = ?)y5       
          `,
      [year1, year2, year3, year4, year5, year1, year2, year3, year4, year5, year1, year2, year3, year4, year5,
        year1, year2, year3, year4, year5, year1, year2, year3, year4, year5, year1, year2, year3, year4, year5,
        year1, year2, year3, year4, year5, year1, year2, year3, year4, year5, year1, year2, year3, year4, year5,
        year1, year2, year3, year4, year5, year1, year2, year3, year4, year5, year1, year2, year3, year4, year5
      ],
      (error, results, fields) => {
        if (error) {
          callBack(error);
        }

        return callBack(null, results);
      }
    );
  },
  getEnt: callBack => {

    pool.query(
      `SELECT  date_format(vstdate,'%Y-%m-%d') as vstdate,count(vn) as count_
      FROM service_time s
      WHERE (s.service4_dep = '083' OR s.service5_dep = '083')
      AND vstdate BETWEEN (CURDATE() - INTERVAL 15 DAY) AND CURDATE()
      GROUP BY vstdate
          `,
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