// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract YieldAgent is ERC721, Ownable, ReentrancyGuard {
    uint256 public nextTokenId;
    uint256 public performanceFeeBps = 1500; // 15%

    struct AgentInfo {
        string name;
        string riskProfile;
        uint256 totalYieldGenerated;
        bool isActive;
    }

    mapping(uint256 => AgentInfo) public agents;

    event AgentCreated(uint256 indexed tokenId, address owner, string name, string riskProfile);
    event YieldHarvested(uint256 indexed tokenId, uint256 yieldAmount, uint256 fee);

    constructor() ERC721("YieldAgent", "YAGENT") Ownable(msg.sender) {}

    function createAgent(string calldata name, string calldata riskProfile) external returns (uint256) {
        uint256 tokenId = nextTokenId++;
        _safeMint(msg.sender, tokenId);

        agents[tokenId] = AgentInfo({
            name: name,
            riskProfile: riskProfile,
            totalYieldGenerated: 0,
            isActive: true
        });

        emit AgentCreated(tokenId, msg.sender, name, riskProfile);
        return tokenId;
    }

    function harvestYield(uint256 tokenId, uint256 yieldAmount) external nonReentrant {
        require(ownerOf(tokenId) == msg.sender, "Not the owner");
        AgentInfo storage agent = agents[tokenId];
        require(agent.isActive, "Agent inactive");

        uint256 fee = (yieldAmount * performanceFeeBps) / 10000;
        uint256 netYield = yieldAmount - fee;

        agent.totalYieldGenerated += netYield;

        // In production: pull tokens from strategy contracts
        payable(msg.sender).transfer(netYield);

        emit YieldHarvested(tokenId, netYield, fee);
    }

    function setPerformanceFee(uint256 newFeeBps) external onlyOwner {
        require(newFeeBps <= 3000, "Fee too high");
        performanceFeeBps = newFeeBps;
    }
}
