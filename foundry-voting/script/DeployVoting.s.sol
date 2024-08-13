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
