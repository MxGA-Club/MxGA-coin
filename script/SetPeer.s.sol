// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {HelperConfig} from "./HelperConfig.s.sol";
import {MXGAOFT_Main} from "../src/MXGAOFT_Main.sol";

contract SetPeer is Script {
    function setPeer(string calldata peerNetworkName) external {
        HelperConfig helperConfig = new HelperConfig();
        (, , string memory sourceNetworkName, , ) = helperConfig.activeNetworkConfig();

        // Get source token address
        address sourceOFTAddress = vm.envAddress(
            string(abi.encodePacked(sourceNetworkName, "_OFT_ADDRESS"))
        );

        // Get peer token address
        address peerOFTAddress = vm.envAddress(
            string(abi.encodePacked(peerNetworkName, "_OFT_ADDRESS"))
        );

        // Get peer network config
        HelperConfig.NetworkConfig memory peerNetworkConfig = helperConfig
            .getNetworkConfigByName(peerNetworkName);

        uint32 EIDPeer = peerNetworkConfig.EID;
        bytes32 bytes32Peer = bytes32(uint256(uint160(peerOFTAddress)));

        // Set peer relationship
        vm.startBroadcast();
        MXGAOFT_Main sourceOFT = MXGAOFT_Main(sourceOFTAddress);
        sourceOFT.setPeer(EIDPeer, bytes32Peer);
        vm.stopBroadcast();
    }
}
