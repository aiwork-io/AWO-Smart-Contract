// const ConvertLib = artifacts.require("ConvertLib");
// const MetaCoin = artifacts.require("MetaCoin");
const AWO = artifacts.require("AWO");
const AWOStaking = artifacts.require("AWOStaking");

module.exports = function(deployer) {
  // deployer.deploy(ConvertLib);
  // deployer.link(ConvertLib, MetaCoin);
  // deployer.deploy(MetaCoin);
    deployer.deploy(AWO);
    deployer.link(AWO,AWOStaking);
    deployer.deploy(AWOStaking);
};
