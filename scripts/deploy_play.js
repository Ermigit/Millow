async function main() {
    const [deployer] = await ethers.getSigners();
    console.log("Deploying contracts with the account:", deployer.address);
  
    const Play = await ethers.getContractFactory("Play");
    const play = await Play.deploy();
  
    console.log("Play contract deployed to:", play.address);
  }
  
  main()
    .then(() => process.exit(0))
    .catch((error) => {
      console.error(error);
      process.exit(1);
    });
  