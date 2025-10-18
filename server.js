// ProofPoint simple backend server
const express = require("express");
const cors = require("cors");
const app = express();

app.use(cors());
app.use(express.json());

app.get("/health", (req, res) => {
  res.json({ status: "ok", message: "ProofPoint backend alive" });
});

app.post("/demo", (req, res) => {
  console.log("Demo data:", req.body);
  res.json({ received: req.body, reply: "Demo POST received" });
});

const PORT = 3000;
app.listen(PORT, () => console.log(`✅ Server running on http://localhost:${PORT}`));
