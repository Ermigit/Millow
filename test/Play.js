const { expect } = require('chai');
const {ethers} = require('hardhat');

describe("Factoral test", async()=>{
  let play;
  before(async ()=>{
  const Play= await ethers.getContractFactory("Play");
  play= await Play.deploy();
  await play.deployed();
  });
  
  it("it should return 1 for n = 0 or n = 1",async()=>{
    expect(await play._factorial(0)).to.equal(1);  
    expect(await play._factorial(1)).to.equal(1);  
  });
  
  it("it should return the factorial is n>1", async()=>{
    expect(await play._factorial(3)).to.equal(6);
  });

  describe("Even or Odd testing",async()=>{
   it("should return Even",async()=>{
    expect( await play.evenOdd(6)).to.equal("Even");
   });
   it("should return odd",async()=>{
    expect(await play.evenOdd(5)).to.equal("Odd");
   });
  });


});



