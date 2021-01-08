var express = require('express');
var router = express.Router();
const {
  createUser,
  getUsers,
  getUserByUserId,
  updateUsers,
  login,
  getDateProcess,
  createDateProcess,
  ReplaceUser

} = require("../controllers/user.controller");
const {
  checkToken2,checkToken
} = require("../auth/jwt");


/* GET users listing. */
/*
router.get('/', function (req, res, next) {
  res.send('respond with a resource');
}); */

router.post("/", checkToken2, createUser);
router.get("/", checkToken2, getUsers);
router.get("/dateprocess", getDateProcess);
router.post("/dateprocess", createDateProcess);
router.patch("/", checkToken2, updateUsers);
router.post("/login", login);
router.get("/:id/:username", checkToken2, getUserByUserId);
router.post("/replace",checkToken2 , ReplaceUser);

module.exports = router;