// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {MXGAOFT_Main} from "../src/MXGAOFT_Main.sol";
import {ILayerZeroEndpointV2} from "@layerzerolabs/lz-evm-protocol-v2/contracts/interfaces/ILayerZeroEndpointV2.sol";
import {SetConfigParam} from "@layerzerolabs/lz-evm-protocol-v2/contracts/interfaces/IMessageLibManager.sol";
import {OptionsBuilder} from "@layerzerolabs/lz-evm-oapp-v2/contracts/oapp/libs/OptionsBuilder.sol";

contract SetConfig is Script {
    using OptionsBuilder for bytes;

    function run() external {
        HelperConfig helperConfig = new HelperConfig();
        (
            address lzEndpoint,
            uint32 EID,
            ,
            address send302,
            address receive302
        ) = helperConfig.activeNetworkConfig();

        address mxgaAddress = vm.envAddress(
            string(abi.encodePacked(networkName, "_OFT_ADDRESS"))
        );

        // Set configuration
        bytes memory options = OptionsBuilder.newOptions()
            .addExecutorLzReceiveOption(200000, 0);

        vm.startBroadcast();
        
        MXGAOFT_Main token = MXGAOFT_Main(mxgaAddress);
        token.setDefaultReceiveOption(EID, options);
        
        vm.stopBroadcast();
    }
}
