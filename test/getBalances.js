const { expect } = require('chai');
const {ethers} = require('hardhat');

async function getSignerBalances() {
  const provider = new ethers.providers.JsonRpcProvider("http://127.0.0.1:8545");
  const signers = await provider.listAccounts();
  console.log(`Found ${signers.length} accounts`);

  for(const signer of signers)
{
 const balance = await provider.getBalance(signer);
 console.log(`Address: ${signer}, Balance: ${ethers.utils.formatEther(balance)} ETH`);

}}
 getSignerBalances().catch(console.error);
 

