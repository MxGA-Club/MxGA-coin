// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {MXGAOFT_Main} from "../src/MXGAOFT_Main.sol";
import {MXGAOFT_Trading} from "../src/MXGAOFT_Trading.sol";

contract DeployMXGA is Script {
    function run() external returns (MXGAOFT_Main, MXGAOFT_Trading) {
        vm.startBroadcast();

        // Deploy Main contract
        MXGAOFT_Main mainToken = new MXGAOFT_Main(
            "MXGA Token",
            "MXGA",
            vm.envAddress("LAYERZERO_ENDPOINT")
        );

        // Deploy Trading contract
        MXGAOFT_Trading tradingToken = new MXGAOFT_Trading(
            "MXGA Token",
            "MXGA",
            vm.envAddress("LAYERZERO_ENDPOINT")
        );

        vm.stopBroadcast();
        return (mainToken, tradingToken);
    }
}
