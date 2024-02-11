const hre = require("hardhat");

const factory = "0x1F98431c8aD98523631AE4a59f267346ea31F984"
const token0 = "0xB4FBF271143F4FBf7B91A5ded31805e42b2208d6"
const token1 = "0x1F98431c8aD98523631AE4a59f267346ea31F984"
const fee = 10000

async function main() {

  const address = await hre.ethers.deployContract("ComputeAddress", []);
  await address.waitForDeployment();
  const getAddress = await address.computeAddress(factory, token0, token1, fee);

  console.log("getAddress:", getAddress);

}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
