// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ReceiveEther {
    //Fallback or receive are functions which are executed when a call to a function which doesn't exist is made.
    /*
    Which function is called, fallback() or receive()?

           send Ether
               |
         msg.data is empty?
              / \
            yes  no
            /     \
receive() exists?  fallback()
         /   \
        yes   no
        /      \
    receive()   fallback()
    */

    // Function to receive Ether. msg.data must be empty
    receive() external payable {}

    // Fallback function is called when msg.data is not empty
    fallback() external payable {}

    function getBalance() public view returns (uint) {
        return address(this).balance; //'this' keyword refers to this contract
    }
}

/* There are 3 ways of sending ether in solidity -
1. transfer - sends 2300 gas and reverts if unseccessful
2. send - sends 2300 gas and returns a boolean value to indicate success
3. call - sends all gas and returns boolean value to indicate success and bytes memory data

call is the most popular method used for sending ether.
transfer is very rarely used.
send is not generally not used.
*/

contract SendEther {
    function sendViaTransfer(address payable _to) public payable {
        _to.transfer(msg.value);
    }

    function sendViaSend(address payable _to) public payable {
        bool sent = _to.send(msg.value); //assigning boolean value returned after execution of send to variable 'sent'
        require(sent, "Failed to send Ether"); //error statement using boolean variable sent in case of unsuccessful send
    }

    function sendViaCall(address payable _to) public payable {
        (bool sent, /*bytes memory data*/) = _to.call{value: msg.value}(""); //commented out bytes memory data for simplicity
        require(sent, "Failed to send Ether");
    }
}
