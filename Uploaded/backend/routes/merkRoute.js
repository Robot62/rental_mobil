import express from "express";
const merkRouter = express.Router();
import db from "../config/db.js";

merkRouter.get("/", (req, res) => {
  let sql = "SELECT * FROM merk";
  let query = db.query(sql, (err, result) => {
    if (err) throw err;
    res.send(result);
  });
});

merkRouter.post("/", (req, res) => {
  let merk = req.body.merk;
  let sql = `INSERT INTO merk VALUES (NULL, '${merk}'); `;
  let query = db.query(sql, (err, result) => {
    if (err) throw err;
    res.send("Data berhasil ditambahkan");
  });
});

merkRouter.post("/:id", (req, res) => {
  let id = req.params.id;
  const data = { ...req.body };
  let sqlCari = "SELECT * FROM merk WHERE id = ?";
  let sqlUpdate = "UPDATE merk SET ? WHERE id = ?;";
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

merkRouter.delete("/:id", (req, res) => {
  let id = req.params.id;
  let sql = `DELETE FROM merk WHERE id = ${id};`;
  let query = db.query(sql, (err, result) => {
    if (err) throw err;
    res.send("Data berhasil dihapus");
  });
});

export default merkRouter;
