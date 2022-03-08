pragma solidity >=0.4.25 <0.7.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/AWOStaking.sol";

contract TestAWOStaking {

  function testAWOStaking() public {
    AWOStaking awsStaking = AWOStaking(DeployedAddresses.AWOStaking());

	int amount = 10000;

	awoStaking.staking(0x58F6e4Ca46Afa8Ff7A94d1295b0F26f714752eCd, amount);

    Assert.equal( awsStaking.lasta() , amount, "is staking amount not right ,check on chain error info");
  }

}
