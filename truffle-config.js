const HDWalletProvider = require('truffle-hdwallet-provider');
const mnemonic = 'misery walnut expose fluid loyal throw combine icon seed imitate item service turn parent elder';

module.exports = {
 networks: {
    development: {
        host: "127.0.0.1",
        port: 9545,
        network_id: "5777"
    },
    mainnet: {
        provider: () => new HDWalletProvider(mnemonic, "https://nd-986-703-606.p2pify.com"),
        network_id: 1,
        gas: 4500000,
        gasPrice: 10000000000
    }
   }
};