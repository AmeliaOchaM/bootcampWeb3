// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

interface IAave {
    function supply(
        address asset,
        uint256 amount,
        uint16 referralCode
    ) external;
    function setUserUseReserveAsCollateral(
        address asset,
        bool useAsCollateral
    ) external;
    function borrow(
        address asset,
        uint256 amount,
        uint256 interestRateMode,
        uint16 referralCode
    ) external;
}

contract Lending {
    address weth = 0x82aF49447D8a07e3bd95BD0d56f35241523fBab1;
    address usdc = 0xaf88d065e77c8cC2239327C5EDb3A432268e5831;
    address aave = 0x794a61358D6845594F94dc1DB02A252b5b4814aD;

    function supplyAndBorrow(uint256 supplyAmount, uint256 borrowAmount) external {
        IERC20(weth).transferFrom(msg.sender, address(this), supplyAmount);

        // Supply to Aave
        IERC20(weth).approve(aave, supplyAmount);
        IAave(aave).supply(weth, supplyAmount, 0);

        // Enable WETH as collateral
        IAave(aave).setUserUseReserveAsCollateral(weth, true);

        // Borrow from Aave
        IAave(aave).borrow(usdc, borrowAmount, 2, 0);

        //transfer usdc ke msg sender
        IERC20(usdc).transfer(msg.sender, borrowAmount);
    }
}
