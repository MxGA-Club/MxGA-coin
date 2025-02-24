// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script, console} from "forge-std/Script.sol";
import {SendParam, IOFT, MessagingFee} from "@layerzerolabs/oft-evm/contracts/interfaces/IOFT.sol";
import {OptionsBuilder} from "@layerzerolabs/lz-evm-oapp-v2/contracts/oapp/libs/OptionsBuilder.sol";
import {HelperConfig} from "./HelperConfig.s.sol";
import {MxGA} from "../src/MxGAOFT_Main.sol";

contract BridgeToken is Script {
    using OptionsBuilder for bytes;

    function bridgeToken(string calldata destinationNetwork) external {
        HelperConfig helperConfig = new HelperConfig();
        (, , string memory networkName, , ) = helperConfig.activeNetworkConfig();

        uint32 destinationEID;
        HelperConfig.NetworkConfig memory destinationNetworkConfig = helperConfig.getNetworkConfigByName(destinationNetwork);
        destinationEID = destinationNetworkConfig.EID;

        vm.startBroadcast();

        address walletAddress = msg.sender;
        uint256 tokensToSend = 1000 * 1e18; // Example: 1000 tokens

        bytes memory options = OptionsBuilder.newOptions().addExecutorLzReceiveOption(200000, 0);

        SendParam memory sendParam = SendParam(
            destinationEID,
            bytes32(uint256(uint160(walletAddress))),
            tokensToSend,
            tokensToSend,
            options,
            "",
            ""
        );

        address mxgaOFTAddress = vm.envAddress(string(abi.encodePacked(networkName, "_OFT_ADDRESS")));
        MxGA mxgaOFT = MxGA(mxgaOFTAddress);

        MessagingFee memory fee = mxgaOFT.quoteSend(sendParam, false);
        console.log("Fee: ", fee.nativeFee);
        
        mxgaOFT.send{value: fee.nativeFee}(sendParam, fee, payable(walletAddress));

        vm.stopBroadcast();
    }
} 