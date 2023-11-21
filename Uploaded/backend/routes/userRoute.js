import express from "express";
const userRouter = express.Router();
import db from "../config/db.js";

userRouter.get("/", (req, res) => {
  let sql = `SELECT * FROM akun;`;
  let query = db.query(sql, (err, result) => {
    if (err) throw err;
    res.send(result);
  });
});

userRouter.post("/", (req, res) => {
  let username = req.body.username;
  let password = req.body.password;
  let sql = `SELECT * FROM akun WHERE username = "${username}" AND password = "${password}";`;
  let query = db.query(sql, (err, result) => {
    if (err) throw err;
    res.send(result);
  });
});

userRouter.post("/add", (req, res) => {
  const data = { ...req.body };
  let sql = "INSERT INTO akun SET ?";
  let query = db.query(sql, data, (err, result) => {
    if (err) throw err;
    res.send("Data berhasil ditambahkan");
  });
});

userRouter.delete("/:id", (req, res) => {
  let id = req.params.id;
  let sql = `DELETE FROM akun WHERE id = ${id};`;
  let query = db.query(sql, (err, result) => {
    if (err) throw err;
    res.send("Data berhasil dihapus");
  });
});

export default userRouter;
