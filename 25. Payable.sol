// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Payable {
    address payable public owner; //This address has been declared payable so that it can send ether

    // Payable constructor can receive Ether
    constructor() payable {
        owner = payable(msg.sender); //It is important to declare an address as payable like in the case of msg.sender, to store it as a payable address
    }

    function deposit() public payable {} //This function has been declared as payable so that it can receive ether.
    // Call this function along with some Ether and the balance of the contract will be updated..

    // If a function isn't declared as payable, and is called with some ether, it will throw an error since the function is not payable.

    function getBalance() external view returns(uint) {
        return address(this).balance; //'this' keyword will call this contract externally to fetch it's balance
    }
    // Function to withdraw all Ether from this contract.
    function withdraw() public {
        // get the amount of Ether stored in this contract
        uint amount = address(this).balance;

        // send all Ether to owner
        (bool success, ) = owner.call{value: amount}("");
        require(success, "Failed to send Ether");
    }

    // Function to transfer Ether from this contract to address from input
    function transfer(address payable _to, uint _amount) public {
        // Note that "to" is declared as payable
        (bool success, ) = _to.call{value: _amount}("");
        require(success, "Failed to send Ether");
    }
}
