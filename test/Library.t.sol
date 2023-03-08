// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/console.sol";
import "forge-std/Test.sol";

import { ERC20 } from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import { MyLibrary } from "../src/MyLibrary.sol";

contract LibraryTest is Test {


	address internal constant alice = address(0x421);

	using MyLibrary for ERC20;

	ERC20 token;

	constructor () { }

	function setUp() public {
		token = new ERC20("TestToken", "TT");
	}

	function testCallWillRevert() public {
		vm.startPrank(alice);
		vm.expectRevert(MyLibrary.justRevertError.selector);
		token.justRevert();
		vm.stopPrank();
	}

	function testCallShouldRevertAfterCall() public {
		vm.startPrank(alice);
		vm.expectRevert(MyLibrary.getBalanceAndRevertError.selector);
		token.getBalanceAndRevert(alice);
		vm.stopPrank();
	}

	function testCallShouldRevertBeforeCall() public {
		vm.startPrank(alice);
		vm.expectRevert(MyLibrary.getBalanceAndRevertError.selector);
		token.getBalanceAndRevertExternalCall(alice);
		vm.stopPrank();
	}

	function testCallWithExternal() public {
		vm.startPrank(alice);
		vm.expectRevert(MyLibrary.getBalanceAndRevertError.selector);
		token.getBalanceAndRevertExternalCall(alice);
		vm.stopPrank();
	}
}
