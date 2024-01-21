//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract Default {

//All datatypes have default values and are assigned those values when a variable is not initialised

    uint public a; //0
    bool public b; //false
    address public locationAddress; //0x0000000000000000000000000000000000000000 (40 zeroes)
    bytes32 public locationBytes32; //0x0000000000000000000000000000000000000000000000000000000000000000 (64 zeroes)
    uint public u = 10; //execution cost	2491 gas
}

contract Constants {

//When a variable is declared as constant it's value can't be changed after the declaration.
//Immutable is similar to constant, just that you can initialise variables declared as immutable using a constructor.
//Once initialised, the value of immutable variables can't be changed.
//Both constant and immutable variable declartions, help reduce gas costs considerably.

    uint public constant U = 10; //execution cost	303 gas
    address public immutable OWNER;
    uint public immutable VALUE = 10; //execution cost	347 gas

    constructor() {
        OWNER = msg.sender; //msg.sender is the address of the user that deployed the contract.
    }
}