const express = require("express");
const bodyParser = require("body-parser");

const app = express();
app.use(bodyParser.json());

app.post("/vote", (req, res) => {
  const { candidateId } = req.body;
  // Handle voting logic, such as recording voting data or interacting with the smart contract.
  res.send(`Voted for candidate ${candidateId}`);
});

app.listen(3001, () => {
  console.log("Server is running on port 3001");
});
