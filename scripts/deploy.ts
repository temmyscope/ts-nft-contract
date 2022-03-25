import { ethers } from "hardhat";

async function main() {

  const nftContractFactory = await ethers.getContractFactory('TsToken');
  const nftContract = await nftContractFactory.deploy();
  await nftContract.deployed();
  console.log("Contract deployed to:", nftContract.address);

  //start minting
  let txn = await nftContract.mintNFTbyTS()
  // Wait for it to be mined.
  await txn.wait();
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
