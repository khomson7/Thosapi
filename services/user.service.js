//const pool = require("../config/database");
const pool2 = require("../config/database2");

module.exports = {


    create: (data, callBack) => {
        pool2.query(
            `insert into user_hos(id, email, password) 
                      values(?,?,?)`,

            [
                data.id,
                data.email,
                data.password

            ],
            (error, results, fields) => {
                if (error) {
                    callBack(error);
                }
                return callBack(null, results);
            }
        );
    },

    getUsers: callBack => {
        pool2.query(
            `select id,username,email from user_hos`,
            [],
            (error, results, fields) => {
                if (error) {
                    callBack(error);
                }
                return callBack(null, results);
            }
        );
    },
    getUserByUserId: (id, username, callBack) => {
        pool2.query(
            `select id,username,email from user_hos where id = ? and username = ?`,
            [id, username],

            (error, results, fields) => {
                if (error) {
                    callBack(error);
                }
                return callBack(null, results);
            }
        );
    },
    ReplaceUser: (data, callBack) => {
        pool2.query(
            `REPLACE INTO user_hos(id, email, password) 
            values(?,?,?)`,

            [
                data.id,
                data.email,
                data.password

            ],
            (error, results, fields) => {
                if (error) {
                    callBack(error);
                }
                return callBack(null, results);
            }
        );
    },

    updateUser: (data, callBack) => {
        pool2.query(
            `update user_hos 
          set password=? , email=? where id = ?`,
            [

                data.password,
                data.email,
                data.id
            ],
            (error, results, fields) => {
                if (error) {
                    callBack(error);
                }
                return callBack(null, results);
            }
        );
    },
    getUserByUserEmail: (email, callBack) => {
        pool2.query(
            `select email,password from user_hos where email = ?`,
            [email],
            (error, results, fields) => {
                if (error) {
                    callBack(error);
                }
                return callBack(null, results[0]);
            }
        );
    },
    getDateProcess: callBack => {
        pool2.query(
            `select d.*,date_format(d.b_date,'%Y-%m-%d') as d_process from date_process d where id = '1'`,
            [],
            (error, results, fields) => {
                if (error) {
                    callBack(error);
                }
                return callBack(null, results);
            }
        );
    },
    createDateProcess: (data, callBack) => {
        pool2.query(
            `replace into date_process(id, b_date) 
                      values(?,?)`,

            [
                data.id,
                data.b_date

            ],
            (error, results, fields) => {
                if (error) {
                    callBack(error);
                }
                return callBack(null, results);
            }
        );
    }

};