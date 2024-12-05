const { expect } = require('chai');
const { ethers } = require('hardhat');

// Helper function to convert to ether units
const tokens = (n) => {
  return ethers.utils.parseUnits(n.toString(), 'ether');
}

describe('Escrow', () => {
  it('saves the addresses', async () => {
    // Deploying the RealEstate contract
    const RealEstate = await ethers.getContractFactory('RealEstate');
    const realEstate = await RealEstate.deploy();
    await realEstate.deployed();
    console.log("RealEstate deployed at address:", realEstate.address);
    
    // Further tests or assertions can be added here
  });


});
