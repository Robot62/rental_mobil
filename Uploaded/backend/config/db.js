import mysql from "mysql";

const db = mysql.createConnection({
  multipleStatements: true,
  host: "localhost",
  user: "root",
  password: "",
  database: "rental_mobil",
});

db.connect((err) => {
  if (err) throw err;
  console.log("Database Connected");
});

export default db;
