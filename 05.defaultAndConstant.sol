//SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

contract Default {
    uint public a; //0
    bool public b; //false
    address public locationAddress; //0x0000000000000000000000000000000000000000 (40 zeroes)
    bytes32 public locationBytes32; //0x0000000000000000000000000000000000000000000000000000000000000000 (64 zeroes)
    uint public u = 10; //execution cost	2491 gas
}

contract Constants {
    uint public constant u = 10; //execution cost	303 gas
}

// To sum up -
// All datatypes have default values and are assigned those values when a variable is not initialised
// When a variable is declared as constant it consumes less gas when called from a contract.