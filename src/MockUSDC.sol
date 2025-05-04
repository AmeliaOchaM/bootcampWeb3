// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol"; //by default, this is the latest version of openzeppelin, idk but its also error

contract MockUSDC is ERC20 {
    constructor() ERC20("MAKAN BERACUN GRATIS", "MBG") {
        // _mint(msg.sender, 1000000 * 10 ** decimals());
    }

    function mint(address to, uint256 amount) public {
        _mint(to, amount);
    }
}
