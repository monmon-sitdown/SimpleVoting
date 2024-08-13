const { ethers } = require("ethers");
const Voting = require("../voting-dapp/src/Voting.json"); // 导入合约的 ABI 和网络信息

async function main() {
  const provider = new ethers.providers.JsonRpcProvider(
    "http://localhost:7545"
  );

  const privateKey =
    "0xb9c1fd6b4a7d758cf0dcf77295ab143088753c3e48da50737727d6c8aef104e3";
  const wallet = new ethers.Wallet(privateKey, provider);

  const contract = new ethers.Contract(
    Voting.networks[1337].address,
    Voting.abi,
    wallet
  );

  await contract.addCandidate("Alice");
  await contract.addCandidate("Bob");
  await contract.addCandidate("Cathy");
  console.log("Candidates added");
}

main().catch(console.error);
