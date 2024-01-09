//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract ownable {
    address public owner; //state variable to store the address of the account that deploys the contract.
    uint public x;
    uint public y;
    constructor() {
        owner = msg.sender; //stored address of the account that deployed the contract in variable 'owner'
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "not owner!"); //check if the same account that deployed the contract is also the owner
        _;
    }

    function setOwner(address _newOwner) external onlyOwner {
        require(_newOwner!=address(0), "invalid address!");
        owner=_newOwner;
    }

    function onlyOwnerCanCall() external onlyOwner {
        x++; //check value of x to see if anyone other than owner can call this func.
    }

    function anyoneCanCall() external {
        y++; //check value of y to see if anyone other than owner can call this func.
    }
}