import express from "express";
const jenisBayarRouter = express.Router();
import db from "../config/db.js";

jenisBayarRouter.get("/", (req, res) => {
  let sql = "SELECT * FROM jenis_bayar";
  let query = db.query(sql, (err, result) => {
    if (err) throw err;
    res.send(result);
  });
});

jenisBayarRouter.post("/", (req, res) => {
  let jenis_bayar = req.body.jenis_bayar;
  let sql = `INSERT INTO jenis_bayar VALUES (NULL, '${jenis_bayar}'); `;
  let query = db.query(sql, (err, result) => {
    if (err) throw err;
    res.send("Data berhasil ditambahkan");
  });
});

jenisBayarRouter.post("/:id", (req, res) => {
  let id = req.params.id;
  const data = { ...req.body };
  let sqlCari = "SELECT * FROM jenis_bayar WHERE id = ?";
  let sqlUpdate = "UPDATE jenis_bayar SET ? WHERE id = ?;";
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

jenisBayarRouter.delete("/:id", (req, res) => {
  let id = req.params.id;
  let sql = `DELETE FROM jenis_bayar WHERE id = ${id};`;
  let query = db.query(sql, (err, result) => {
    if (err) throw err;
    res.send("Data berhasil dihapus");
  });
});

export default jenisBayarRouter;
