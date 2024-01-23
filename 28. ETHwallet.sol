// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract EtherWallet {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    receive() external payable {}
    //we have used receive instead of fallback to ensure that only transactions
    //for sending ether is allowed and not calls to functions that don't exist.


    function withdraw(uint _amount) external {
        require(msg.sender == owner, "caller is not owner"); //error statement to ensure only owner can withdraw balance
        payable(msg.sender).transfer(_amount);
    }

    function sendViaCall(address payable _to) public payable {
        (bool sent, /*bytes memory data*/) = _to.call{value: msg.value}(""); //commented out bytes memory data for simplicity
        require(sent, "Failed to send Ether");
    }

    //helper function to get balance
    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}
