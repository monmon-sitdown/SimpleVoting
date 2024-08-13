const express = require("express");
const bodyParser = require("body-parser");

const app = express();
app.use(bodyParser.json());

app.post("/vote", (req, res) => {
  const { candidateId } = req.body;
  // 处理投票逻辑，例如记录投票数据或与智能合约交互
  res.send(`Voted for candidate ${candidateId}`);
});

app.listen(3001, () => {
  console.log("Server is running on port 3001");
});
