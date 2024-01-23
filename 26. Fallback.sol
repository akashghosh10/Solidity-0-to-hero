// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Fallback {
    event Log(string func, uint gas);

    // Fallback function must be declared as external.
    fallback() external payable {
        // send / transfer (forwards 2300 gas to this fallback function)
        // call (forwards all of the gas)
        emit Log("fallback", gasleft());
    }

    // Receive is a variant of fallback that is triggered when msg.data is empty
    receive() external payable {
        emit Log("receive", gasleft());
    }

    // Helper function to check the balance of this contract
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}

contract SendToFallback {
    function transferToFallback(address payable _to) public payable {
        _to.transfer(msg.value);
    }

    function callFallback(address payable _to) public payable {
        (bool sent, ) = _to.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
    }
}

//If fallback is not defined and only receive is defined in a contract,
//if an external contract tries to call a function that doesn't exist in
//this contract, receive will not be executed and an error will be thrown
//Receive can be used alone in a contract to ensure that other contracts
//are able to send ether.

//<refer to sendETH.sol for details on how ether is being sent>