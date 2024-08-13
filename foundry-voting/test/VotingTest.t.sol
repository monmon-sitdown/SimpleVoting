// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {Test} from "forge-std/Test.sol";
import {Voting} from "../src/Voting.sol";

contract VotingTest is Test {
    address VOTER1 = makeAddr("voter1");
    address VOTER2 = makeAddr("voter2");
    Voting voting;

    function setUp() public {
        voting = new Voting();
    }

    function testAddCandidate() public {
        voting.addCandidate("Alice");
        Voting.Candidate memory candidate1 = voting.getCandidate(1);

        assertEq(candidate1.id, 1);
        assertEq(candidate1.name, "Alice");
        assertEq(candidate1.voteCount, 0);
    }

    function testVote() public {
        voting.addCandidate("Alice");
        voting.addCandidate("Bob");

        vm.prank(VOTER1);
        voting.vote(1);
        vm.prank(VOTER2);
        voting.vote(2);

        Voting.Candidate memory candidate1 = voting.getCandidate(1);
        Voting.Candidate memory candidate2 = voting.getCandidate(2);

        assertEq(candidate1.voteCount, 1);
        assertEq(candidate2.voteCount, 1);
    }

    function testFailVoteTwice() public {
        voting.addCandidate("Alice");
        voting.addCandidate("Bob");
        voting.vote(1);
        voting.vote(2); // 这行代码应该触发失败，因为一个地址不能投两次票
    }

    function testFailVoteInvalidCandidate() public {
        voting.vote(99); // 这行代码应该触发失败，因为没有ID为99的候选人
    }
}
