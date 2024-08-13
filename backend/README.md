# Voting DApp Backend Script

This backend script interacts with the Voting smart contract to add candidates to the blockchain. It is a Node.js script using the ethers.js library to connect to a local Ethereum blockchain and manage the Voting contract.

## Prerequistes

Before running the script, ensure you have the following:

- **Node.js** and **npm** installed on your machine.
- A local Ethereum blockchain running (e.g., Ganache).
- The `Voting.sol` smart contract deployed on the same network.

## Setup and Usage

### 1. Install Dependencies

Ensure you have ethers.js installed:

```
npm install ethers
```

### 2.Update the Script

Make sure the following configurations in the script match your local setup:

- Provider: Ensure the JsonRpcProvider URL matches your local blockchain (e.g., Ganache).

- Private Key: Use the private key of the account you wish to interact with.

- Network ID: Make sure the network ID (1337 for Ganache) and contract address are correct.

### 3. Run the Script

To execute the script and add candidates to the voting contract:

```
node addCandidates.js
```

This will add three candidates ("Alice", "Bob", and "Cathy") to the contract.
