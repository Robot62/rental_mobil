import express from "express";
const perjalananRouter = express.Router();
import db from "../config/db.js";

perjalananRouter.get("/", (req, res) => {
  let sql = "SELECT * FROM perjalanan";
  let query = db.query(sql, (err, result) => {
    if (err) throw err;
    res.send(result);
  });
});

perjalananRouter.post("/", (req, res) => {
  const data = { ...req.body };
  let sql = `INSERT INTO perjalanan SET ?`;
  let query = db.query(sql, data, (err, result) => {
    if (err) throw err;
    res.send("Data berhasil ditambahkan");
  });
});

perjalananRouter.post("/:id", (req, res) => {
  let id = req.params.id;
  const data = { ...req.body };
  console.log(data);
  let sqlCari = "SELECT * FROM perjalanan WHERE id = ?";
  let sqlUpdate = "UPDATE perjalanan SET ? WHERE id = ?;";
  let query = db.query(sqlCari, id, (err, rows, result) => {
    if (err) throw err;
    if (rows.length) {
      db.query(sqlUpdate, [data, id], (err, rows, field) => {
        if (err) throw err;
        res
          .status(200)
          .json({ success: true, message: "Data berhasil di update" });
      });
    }
  });
});

perjalananRouter.delete("/:id", (req, res) => {
  let id = req.params.id;
  let sql = `DELETE FROM perjalanan WHERE id = ${id};`;
  let query = db.query(sql, (err, result) => {
    if (err) throw err;
    res.send("Data berhasil dihapus");
  });
});

export default perjalananRouter;
