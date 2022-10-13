// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract Vault {
  //slot 0
  bool public locked;
  //slot 1
  bytes32 private password;

  constructor(bytes32 _password) {
    locked = true;
    password = _password;
  }

  function unlock(bytes32 _password) public {
    if (password == _password) {
      locked = false;
    }
  }
}