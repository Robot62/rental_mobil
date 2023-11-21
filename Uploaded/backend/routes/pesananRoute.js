import express from "express";
const pesananRouter = express.Router();
import db from "../config/db.js";

pesananRouter.get("/", (req, res) => {
  let sqlPemesan = `SELECT 
  pesanan.*,
    pemesan.nama, 
    mobil.nama_mobil, 
    jenis_bayar.jenis_bayar,
    perjalanan.asal,
    perjalanan.tujuan,
   perjalanan.jarak
FROM pesanan 
JOIN pemesan 
  ON pesanan.id_pemesan = pemesan.id 
JOIN mobil 
  ON pesanan.id_mobil = mobil.id 
JOIN jenis_bayar 
  ON pesanan.id_jenis_bayar = jenis_bayar.id
JOIN perjalanan
  ON pesanan.id_perjalanan = perjalanan.id;`;
  let query = db.query(sqlPemesan, (err, result) => {
    if (err) throw err;
    res.send(result);
  });
});

pesananRouter.post("/", (req, res) => {
  const data = { ...req.body };
  let sql = `INSERT INTO pesanan SET ?`;
  let query = db.query(sql, data, (err, result) => {
    if (err) throw err;
    res.send("Data berhasil ditambahkan");
  });
});

pesananRouter.post("/:id", (req, res) => {
  let id = req.params.id;
  const data = { ...req.body };
  let sqlCari = "SELECT * FROM pesanan WHERE id = ?";
  let sqlUpdate = "UPDATE pesanan SET ? WHERE id = ?;";
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

pesananRouter.delete("/:id", (req, res) => {
  let id = req.params.id;
  let sql = `DELETE FROM pesanan WHERE id = ${id};`;
  let query = db.query(sql, (err, result) => {
    if (err) throw err;
    res.send("Data berhasil dihapus");
  });
});

export default pesananRouter;
