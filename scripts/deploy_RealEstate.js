
async function main() {
    const [deployer, signer1, signer2, ...others] = await ethers.getSigners();
    // Use the desired signer (e.g., signer1)
    const lastsigner = others[others.length - 1];
     
    const nonce = await ethers.provider.getTransactionCount(lastsigner.address);
    console.log("Nonce before deployment:", nonce);

    const RealEstateFactory = await ethers.getContractFactory("RealEstate", lastsigner);
    const RealEstate = await RealEstateFactory.deploy();
  
    await RealEstate.deployed();

    console.log("Deployed by account:", lastsigner.address);
    console.log("Play contract deployed to:", RealEstate.address);



console.log("###############################");
const nonce_after_deployment = await ethers.provider.getTransactionCount(lastsigner.address);
console.log("Nonce after deployment:", nonce_after_deployment);


  }
  
  
  main()
    .then(() => process.exit(0))
    .catch((error) => {
      console.error(error);
      process.exit(1);
    });
  