//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract constructors {
    address public owner;
    uint public x;

    //A constructor is special type of function that is mainly used to initialise state variables.
    //Unlike normal functions, it can be called only once when the contract is deployed.
    constructor(uint input) {
        owner = msg.sender; //msg.sender is the address of the user that deployed the contract.
        x=input;
    }
}