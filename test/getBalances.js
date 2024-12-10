const { expect } = require('chai');
const {ethers} = require('hardhat');

// describe("Play test", async()=>{
//   let play;
//   before(async ()=>{
//   const Play= await ethers.getContractFactory("Play");
//   play= await Play.deploy();
//   await play.deployed();
//   });


//   describe("All tests",async()=>{
//    it("should return Even",async()=>{
//     expect( await play.evenOdd(6)).to.equal("Even");
//    });
//    it("should return odd",async()=>{
//     expect(await play.evenOdd(5)).to.equal("Odd");
//    });

//    it("it should return 1 for n = 0 or n = 1",async()=>{

//     expect((await play._factorial(0)).toString()).to.equal("1");
//     expect(( await play._factorial(1)).toString()).to.equal("1");
    
//    });
//   it("it should return the factorial is n>1",async()=>{
//     expect( (await play._factorial(3)).toString()).to.equal("6");

//    });
//   });


// });


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
 

