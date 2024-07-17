const HDWalletProvider = require('@truffle/hdwallet-provider');
const fs = require('fs');

module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",
      port: 8545,
      network_id: "*", // Match any network id
    },
    ropsten: {
      provider: () => new HDWalletProvider(
        fs.readFileSync(".secret").toString().trim().split('\n'),
        `https://ropsten.infura.io/v3/YOUR_INFURA_PROJECT_ID`
      ),
      network_id: 3, // Ropsten network id
    },
    // Define other networks similarly...
  },
  // Other configurations...
};
