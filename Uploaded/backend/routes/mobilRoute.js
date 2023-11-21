import express from "express";
const mobilRouter = express.Router();
import db from "../config/db.js";

mobilRouter.get("/", (req, res) => {
  let sql = "SELECT * FROM mobil";
  let query = db.query(sql, (err, result) => {
    if (err) throw err;
    res.send(result);
  });
});

mobilRouter.post("/", (req, res) => {
  const data = { ...req.body };
  let sql = "INSERT INTO mobil SET ?";
  let query = db.query(sql, data, (err, result) => {
    if (err) throw err;
    res.send("Data berhasil ditambahkan");
  });
});

mobilRouter.post("/:id", (req, res) => {
  let id = req.params.id;
  const data = { ...req.body };
  let sqlCari = "SELECT * FROM mobil WHERE id = ?";
  let sqlUpdate = "UPDATE mobil SET ? WHERE id = ?;";
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

mobilRouter.delete("/:id", (req, res) => {
  let id = req.params.id;
  let sql = `DELETE FROM mobil WHERE id = ${id};`;
  let query = db.query(sql, (err, result) => {
    if (err) throw err;
    res.send("Data berhasil dihapus");
  });
});

export default mobilRouter;
