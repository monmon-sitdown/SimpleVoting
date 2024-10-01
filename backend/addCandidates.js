require("dotenv").config();
const { ethers } = require("ethers");
const Voting = require("../voting-dapp/src/Voting.json"); // 导入合约的 ABI 和网络信息

async function main() {
  const provider = new ethers.providers.JsonRpcProvider(
    //process.env.SEPOLIA_RPC_URL
    process.env.GANACHE_URL
  );

  //const privateKey = process.env.PRIVATE_KEY;
  const privateKey = process.env.GANACHE_KEY;
  const wallet = new ethers.Wallet(privateKey, provider);

  const contract = new ethers.Contract(
    Voting.networks[1337].address,
    //Voting.networks[11155111].address,
    Voting.abi,
    wallet
  );

  await contract.addCandidate("Dennis");
  console.log("Candidates added");
}

main().catch(console.error);
