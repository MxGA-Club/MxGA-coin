// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@layerzerolabs/solidity-examples/contracts/token/oft/v2/OFTCore.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MXGAOFT_Main is OFTCore, ERC20 {
    constructor(
        string memory _name,
        string memory _symbol,
        address _lzEndpoint
    ) ERC20(_name, _symbol) OFTCore(_lzEndpoint) {
        _mint(msg.sender, 1_000_000 * 10**decimals()); // Mint 1M tokens to deployer
    }

    function _debitFrom(address _from, uint16 _dstChainId, bytes32 _toAddress, uint _amount)
        internal
        virtual
        override
        returns (uint)
    {
        _burn(_from, _amount);
        return _amount;
    }

    function _creditTo(uint16 _srcChainId, address _toAddress, uint _amount)
        internal
        virtual
        override
        returns (uint)
    {
        _mint(_toAddress, _amount);
        return _amount;
    }

    function circulatingSupply() public view virtual override returns (uint) {
        return totalSupply();
    }

    function token() public view virtual override returns (address) {
        return address(this);
    }
}
