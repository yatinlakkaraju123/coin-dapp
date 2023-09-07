const Coin = artifacts.require("coin.sol");

module.exports = function(deployer)
{
    deployer.deploy(Coin);
}