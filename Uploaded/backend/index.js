import express from "express";
import cors from "cors";
import morgan from "morgan";
import bodyParser from "body-parser";

// Database Connection
import("./config/db.js");

// Router
import userRouter from "./routes/userRoute.js";
import mobilRouter from "./routes/mobilRoute.js";
import merkRouter from "./routes/merkRoute.js";
import jenisBayarRouter from "./routes/jenisBayarRoute.js";
import pemesanRouter from "./routes/pemesanRoute.js";
import perjalananRouter from "./routes/perjalananRoute.js";
import pesananRouter from "./routes/pesananRoute.js";

const app = express();
app.use(cors());
app.use(morgan("tiny"));
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: false }));

app.use("/user", userRouter);
app.use("/mobil", mobilRouter);
app.use("/merk", merkRouter);
app.use("/jenisBayar", jenisBayarRouter);
app.use("/pemesan", pemesanRouter);
app.use("/perjalanan", perjalananRouter);
app.use("/pesanan", pesananRouter);

const port = 8000;

app.listen(port, () => {
  console.log("server running on http://localhost:" + port);
});
