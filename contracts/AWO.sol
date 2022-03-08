pragma solidity ^0.5.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20Detailed.sol";

contract AWO is ERC20, ERC20Detailed {
    constructor() ERC20Detailed("AIWORK", "AWO", 18) public {

        _mint(msg.sender, 10000000000*10** uint256(18) );

    }
}