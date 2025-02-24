// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";

contract HelperConfig is Script {
    NetworkConfig public activeNetworkConfig;

    struct NetworkConfig {
        address lzEndpoint;
        uint32 EID;
        string networkName;
        address send302;
        address receive302;
    }

    constructor() {
        if (block.chainid == 11155111) {
            activeNetworkConfig = getSepoliaConfig();
        } else if (block.chainid == 137) {
            activeNetworkConfig = getPolygonConfig();
        } else if (block.chainid == 8453) {
            activeNetworkConfig = getBaseConfig();
        } else if (block.chainid == 42161) {
            activeNetworkConfig = getArbitrumConfig();
        } else {
            revert("Unsupported network");
        }
    }

    function getNetworkConfigByName(string memory name) public pure returns (NetworkConfig memory) {
        if (keccak256(abi.encodePacked(name)) == keccak256(abi.encodePacked("SEPOLIA"))) {
            return getSepoliaConfig();
        } else if (keccak256(abi.encodePacked(name)) == keccak256(abi.encodePacked("POLYGON"))) {
            return getPolygonConfig();
        } // ... add other networks
        revert("Unknown network name");
    }

    function getSepoliaConfig() public pure returns (NetworkConfig memory) {
        return NetworkConfig({
            lzEndpoint: 0x6EDCE65403992e310A62460808c4b910D972f10f,
            EID: 40161,
            networkName: "SEPOLIA",
            send302: 0xb4110287B059258328e0a6C045EC59575bD30Ee0,
            receive302: 0x862847B44845eD331dc8FA211Df3C01eCBB1b38C
        });
    }

    // Add other network configs as needed
}
