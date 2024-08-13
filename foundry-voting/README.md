# Voting Smart Contract

This Solidity smart contract implements a simple voting system. It allows users to add candidates, vote for them, and track the results in a secure and decentralized manner.

## Contract Overview

The `Voting.sol` contract includes the following features:

- **Candidate Management:** Users can add candidates to the voting system.
- **Voting:** Each user can vote for a candidate. The contract ensures that each user can only vote once.
- **Result Tracking:** The contract tracks the number of votes each candidate receives and stores information about voters.

## Prerequistes

- Solidiy version 0.8.20
- An Ethereum development evironment(e.g., Remix, Hardhat, Foundry)
- A test Ethereum network (e.g., Ganache, Sepolia)

## Contract Details

### State Variables

- `candidates`: A mapping that stores candidates by their ID. Each candidate is represented by a `Candidate` struct containing the candidate's ID, name, and vote count.
- `hasVoted`: A mapping that tracks whether an address has already voted.This prevents duplicate voting.
- `voterInfo`: A mapping that stores the candidate ID that each voter has voted for
- `voters`: An arry that atores all voters' information.
- `candidatesCount`: A counter that tracks the total number of candidates.

### Structs

- **Candidate:** Contrains the candidate's `id`, `name`, and `voteCount`
- **Voter** : Contains the voter's `voterAddress` and the `candidateId` they voted for.

### Events

- **Voted:** This event is emitted whenever a vote is cast, recording the `candidateID` that was voted for.

### Functions

- `addCandidate`: Adds a new candidate to the contract, increments the `candidatesCount` and sotores the candidate in the `candidates` mapping.
- `vote`: Allows a user to vote for a candidate, ensures that the user has not already voted and that the candidate ID is valid; Updates the vote count for the selected candidate and records the voter's information

## Deployment

To deploy the contract, you can use any Ethereum development tool like Remix, Foundry, or Hardhat. Here’s a quick overview of the deployment process using Remix:

Copy the Voting.sol code into Remix.
Compile the contract using the Solidity compiler version 0.8.20.
Deploy the contract to your chosen Ethereum network (e.g., local Ganache instance or a test network like Sepolia).
Interact with the contract using Remix or through a front-end DApp.
