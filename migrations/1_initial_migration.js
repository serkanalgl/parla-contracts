const ParlaERC20 = artifacts.require("ParlaERC20");

module.exports = async function (deployer) {

  await deployer.deploy(ParlaERC20);
  const parla = await ParlaERC20.deployed();
};
