import { ethers } from "hardhat";

async function main() {
  const YieldAgent = await ethers.getContractFactory("YieldAgent");
  const yieldAgent = await YieldAgent.deploy();

  await yieldAgent.waitForDeployment();

  console.log("YieldAgent deployed to:", await yieldAgent.getAddress());
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
