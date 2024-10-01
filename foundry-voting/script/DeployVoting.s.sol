// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script, console} from "forge-std/Script.sol";
import {Voting} from "../src/Voting.sol";

contract DeployVoting is Script {
    function run() external {
        vm.startBroadcast();

        // 部署 Voting 合约
        Voting voting = new Voting();

        console.log("Voting contract deployed at:", address(voting));

        vm.stopBroadcast();
    }
}

/**
 * ##### sepolia
 * ✅  [Success]Hash: 0x5d3b8ea4cb6cc63aa7c6711e2d32dda0469d997a3f3e6671be5431eb4881ef25
 * Contract Address: 0x79Bd6DCb15Ca2b0B0abe5EAa1A7bCBD2d5d379E7
 * Block: 6489965
 * Paid: 0.003410351733437102 ETH (597617 gas * 5.706584206 gwei)
 *
 * ##### ganache
 * ✅  [Success]Hash: 0xa6410687546ff12dd87986f952be05bd37eb99db78b6b7b008cc4d7e92ea9d3b
 * Contract Address: 0x878a049752a5f1dB7a62e2cCa2B282C229226dF4
 * Block: 119
 * Paid: 0.001792371240177714 ETH (597457 gas * 3.000000402 gwei)
 */
