
async function main() {
    const [deployer, signer1, signer2, ...others] = await ethers.getSigners();
    // Use the desired signer (e.g., signer1)
    //const lastsigner = others[others.length - 1];
    const RealEstateFactory = await ethers.getContractFactory("RealEstate", deployer);
    const RealEstate = await RealEstateFactory.deploy();
  
    await RealEstate.deployed();

    console.log("Deployed by account:", deployer.address);
    console.log("Play contract deployed to:", RealEstate.address);
  }
  
  
  main()
    .then(() => process.exit(0))
    .catch((error) => {
      console.error(error);
      process.exit(1);
    });
  