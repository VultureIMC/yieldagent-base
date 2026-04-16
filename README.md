# YieldAgent

Autonomous AI-powered yield optimization platform built on Base.

Users describe their risk profile in plain text. The AI Agent automatically optimizes yield farming, lending, auto-compounding and rebalancing across Aerodrome, Seamless and other protocols on Base.

Agents are tokenized as ERC-721 NFTs with performance-based revenue sharing.

## Features
- Natural language agent creation
- Automated yield strategies
- On-chain performance fee vault
- Full ownership and tradability of agents

## Tech Stack
- Solidity 0.8.24 + Hardhat
- Next.js 15 + TypeScript + Tailwind + wagmi + viem
- Deployed on Base (Mainnet & Sepolia)

## Quick Start

### Smart Contracts
```bash
npm install
npx hardhat compile
npx hardhat test
npx hardhat run scripts/deploy.js --network baseSepolia
