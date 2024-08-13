// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

/**
 * @title Voting
 * @author monmon
 * @dev Implements a simple voting contract that allows users to add candidates and vote for them.
 * The contract procides the following features:
 * - Adding candidates
 * - Voting for candidates
 * - Retrieving candidate infromation
 * - Retrieving all votes' information
 *
 * State variables:
 * - candidates: A mapping to store candidate information, using candidate ID as the key.
 * - hasVoted: A mapping to tract whether an address has already voted, preventing duplicate voting.
 * - voterInfor: A mapping to store the candidate ID that each voter has voted for
 * - voters: An array to store all voters' information.
 * - candidatesCount: A counter to tract the number of candidates.
 *
 * Event:
 * - Voted: Triggered when a user votes, recording the candidate ID that was voted for.
 */
contract Voting {
    struct Candidate {
        uint256 id;             //Unique ID for the candidate
        string name;            //Candidate's name
        uint256 voteCount;      //Number of votes the candidate has received
    }

    struct Voter {
        address voterAddress;   //Address of the voter
        uint256 candidateId;    //ID of the candidate the voter voted
    }

    mapping(uint256 => Candidate) public candidates;    //Mapping to store candidate information
    mapping(address => bool) public hasVoted;           //Mapping to track if an address has already voted
    mapping(address => uint256) public voterInfo;       //Mapping to store the candidate ID each voter voted for
    Voter[] public voters;                              //Array to store all voters' information
    uint256 public candidatesCount;                     //Counter to track the number of candidates

    event Voted(uint256 indexed candidateId);           //Event triggered when a user votes

    /**
     * @dev Adds a new candidate. This function can be called by anyone.
     * @param _name The name of the candidate
     */
    function addCandidate(string memory _name) public {
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

    /**
     * @dev Allows a user to vote for a candidate. A user can vote only once.
     * @param _candidateId The ID of the candidate being voted for
     */
    function vote(uint256 _candidateId) public {
        require(!hasVoted[msg.sender], "You have already voted.");
        require(_candidateId > 0 && _candidateId <= candidatesCount, "Invalid candidate.");

        hasVoted[msg.sender] = true;
        candidates[_candidateId].voteCount++;
        voterInfo[msg.sender] = _candidateId;
        voters.push(Voter(msg.sender, _candidateId));

        emit Voted(_candidateId);
    }

    /**
     * @dev Retrieves the information of a specific candidate.
     * @param _candidateId The ID of the candidate
     * @return The candidate's details as a struct
     */
    function getCandidate(uint256 _candidateId) public view returns (Candidate memory) {
        return candidates[_candidateId];
    }

    /**
     * @dev Retrieves the information of all voters.
     * @return An array of Voter structs containing all voters' information
     */
    function getVoters() public view returns (Voter[] memory) {
        return voters;
    }
}
