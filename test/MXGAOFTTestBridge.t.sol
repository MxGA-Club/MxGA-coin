// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Test} from "forge-std/Test.sol";
import {MXGAOFT_Main} from "../src/MXGAOFT_Main.sol";
import {MXGAOFT_Trading} from "../src/MXGAOFT_Trading.sol";

contract MXGAOFTTest is Test {
    MXGAOFT_Main public mainToken;
    MXGAOFT_Trading public tradingToken;
    address public deployer;

    function setUp() public {
        deployer = makeAddr("deployer");
        vm.startPrank(deployer);
        
        mainToken = new MXGAOFT_Main(
            "MXGA Token",
            "MXGA",
            makeAddr("lzEndpoint")
        );
        
        tradingToken = new MXGAOFT_Trading(
            "MXGA Token",
            "MXGA",
            makeAddr("lzEndpoint")
        );
        
        vm.stopPrank();
    }

    function test_InitialSupply() public {
        assertEq(mainToken.balanceOf(deployer), 1_000_000 * 10**18);
        assertEq(tradingToken.balanceOf(deployer), 0);
    }
}
