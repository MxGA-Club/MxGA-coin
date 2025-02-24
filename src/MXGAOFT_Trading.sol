// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "./MXGAOFT_Main.sol";

contract MXGAOFT_Trading is MXGAOFT_Main {
    constructor(
        string memory _name,
        string memory _symbol,
        address _lzEndpoint
    ) MXGAOFT_Main(_name, _symbol, _lzEndpoint) {
        // No initial minting on trading contracts
    }
}
