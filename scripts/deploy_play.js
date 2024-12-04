
        async function main() {
            const [deployer, signer1, signer2, ...others] = await ethers.getSigners();
            // Use the desired signer (e.g., signer1)
            //const lastsigner = others[others.length - 1];
            const playFactory = await ethers.getContractFactory("Play", deployer);
            const play = await playFactory.deploy();
          
            await play.deployed();

            console.log("Deployed by account:", deployer.address);
            console.log("Play contract deployed to:", play.address);
          }
          
          
          main()
            .then(() => process.exit(0))
            .catch((error) => {
              console.error(error);
              process.exit(1);
            });
          