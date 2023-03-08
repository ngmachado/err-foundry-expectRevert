// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import  { IERC20 } from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

/*
    vm.expectRevert catch errors on the next call. CALL = 1
    If we increment the call number, we don't catch the error. CALL = 1 + 1
*/

library MyLibrary {

    error getBalanceAndRevertError();
    error justRevertError();

    function getBalanceAndRevert(IERC20 token, address receiver) internal view
    {
        // this will make expectRevert to be call + 1 :(
        uint256 myCrazyBalance = token.balanceOf(receiver);
        revert getBalanceAndRevertError();
    }

    function getRevertAndBalance(IERC20 token, address receiver) internal view
    {
        // this will make expectRevert call = 1
        revert getBalanceAndRevertError();
        uint256 myCrazyBalance = token.balanceOf(receiver);
    }

    function justRevert(IERC20 token) internal view
    {
        // this will make expectRevert call = 1
        revert justRevertError();
    }

    function getBalanceAndRevertExternalCall(IERC20 token, address receiver) external view
    {
        uint256 myCrazyBalance = token.balanceOf(receiver);
        revert getBalanceAndRevertError();
    }
}
