//const ConvertLib = artifacts.require("ConvertLib");
const ColdChain = artifacts.require("ColdChain");

module.exports = function(deployer) {
  //deployer.deploy(ConvertLib);
  //deployer.link(ConvertLib, ColdChain);
  deployer.deploy(ColdChain);
};
