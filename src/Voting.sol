// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Voting {
    struct Candidate {
        uint256 id;
        string name;
        uint256 voteCount;
    }

    struct Voter {
        address voterAddress;
        uint candidateId;
    }

    mapping(uint256 => Candidate) public candidates;
    mapping(address => bool) public hasVoted;
    mapping(address => uint) public voterInfo;
    Voter[] public voters;
    uint256 public candidatesCount;

    event Voted(uint256 indexed candidateId);

    function addCandidate(string memory _name) public {
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

    function vote(uint256 _candidateId) public {
        require(!hasVoted[msg.sender], "You have already voted.");
        require(
            _candidateId > 0 && _candidateId <= candidatesCount,
            "Invalid candidate."
        );

        hasVoted[msg.sender] = true;
        candidates[_candidateId].voteCount++;
        voterInfo[msg.sender] = _candidateId;
        voters.push(Voter(msg.sender, _candidateId));

        emit Voted(_candidateId);
    }

    function getCandidate(
        uint256 _candidateId
    ) public view returns (Candidate memory) {
        return candidates[_candidateId];
    }

    function getVoters() public view returns (Voter[] memory) {
        return voters;
    }
}
