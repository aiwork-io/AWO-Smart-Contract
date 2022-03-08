pragma solidity ^0.5.0;
import "@openzeppelin/contracts/math/SafeMath.sol";

contract AWOT{
	function transferFrom(address sender, address recipient, uint256 amount) public returns (bool);
	function balanceOf(address account) public returns (uint256);
}
contract AWOStaking{

	using SafeMath for uint256;

	mapping (uint256 => uint256) stakingHistory;
	uint256	lastAmount = 0;
	uint256	lastDate = 0;

	address[] whitelist=[
		0xdD3180609979c0e735CF26e220247d7f6945b306,
		0x1B65524921AB95D527b9ccF66816ea63D4a7E184];

	address awoContractAddr = 0x419186D480F5268a5a4EA4eCDe7108f3e0aeA52c;
	address incomeAddr = 0xa9b85a1c8e25e6a66fEf8294FB6de58FDA104D11;
    uint256 krate = 3829000;

    function  lasta() public view returns (uint256) {
           return lastAmount;
    }
    function  lastd() public view returns (uint256) {
               return lastDate;
    }
    function  history(uint256 idate) public view returns (uint256){
     	return stakingHistory[idate];
    }


	function staking(address from, uint256 amount) public{
     		uint256 totalSave = 0;

     		//utc data timestamp
     		uint256 dataTimestamp =  now - now%(24*3600);

     		AWOT awo = AWOT(awoContractAddr);

			require(amount > 0, "Error: amount > 0 ");
			require(stakingHistory[dataTimestamp] == 0, "Error: one day one call");

			//check max
			for(uint256 i=0;i<whitelist.length;i++){
				totalSave = totalSave.add(  awo.balanceOf(whitelist[i]) );
			}

			totalSave.sub(amount,"Error: is amount right?");

			if(lastAmount>0){
				if(lastAmount>amount){
					//send yesterday reward
     				awo.transferFrom(from,incomeAddr,amount.mul(krate).div(10000000000,"Error: amount div error"));
     			}else{
					awo.transferFrom(from,incomeAddr,lastAmount.mul(krate).div(10000000000,"Error: lastAmount div error"));
     			}
			}
			//save today staking amount for tomorrow rewark
			lastDate = dataTimestamp;
			lastAmount = amount;
			stakingHistory[dataTimestamp] = amount;
	}
}

