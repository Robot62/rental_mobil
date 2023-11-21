import express from "express";
const pemesanRouter = express.Router();
import db from "../config/db.js";

pemesanRouter.get("/", (req, res) => {
  let sql = "SELECT * FROM pemesan";
  let query = db.query(sql, (err, result) => {
    if (err) throw err;
    res.send(result);
  });
});

pemesanRouter.post("/", (req, res) => {
  const data = { ...req.body };
  let sql = "INSERT INTO pemesan SET ?";
  let query = db.query(sql, data, (err, result) => {
    if (err) throw err;
    res.send("Data berhasil ditambahkan");
  });
});

pemesanRouter.post("/:id", (req, res) => {
  let id = req.params.id;
  const data = { ...req.body };
  let sqlCari = "SELECT * FROM pemesan WHERE id = ?";
  let sqlUpdate = "UPDATE pemesan SET ? WHERE id = ?;";
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

pemesanRouter.delete("/:id", (req, res) => {
  let id = req.params.id;
  let sql = `DELETE FROM pemesan WHERE id = ${id};`;
  let query = db.query(sql, (err, result) => {
    if (err) throw err;
    res.send("Data berhasil dihapus");
  });
});

export default pemesanRouter;
