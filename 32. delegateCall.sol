// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

//delegate call is similar to call.
//When contract A delegate calls contract B, the code of contract B is executed using the storage, msg.sender and msg.value of contract A
//Hence, the changes are made to the state variables of contract A while the state variables of B remains as it is.
//We can use delegate call to update the code of a contract even after it has been deployed in the sense that,
//we can update the code of contract B and redeploy it to make changes to the state variables of contract A accordingly.
//However, we should always be very careful when using delegate call as it can easily make our contract vulnerable.
//Hackers can become the owner of a contract or call self destruct using delegate call if proper measures are not taken.

// NOTE: Deploy this contract first
contract B {
    // NOTE: storage layout must be the same as contract A, meaning the order of the variable declarations must be same as that of A.
    //Otherwise, the data will be stored in different memory slots than intended, and result into some unforeseen changes in the state variables of contract A. 
    uint public num;
    address public sender;
    uint public value;

    function setVars(uint _num) public payable {
        num = _num;
        sender = msg.sender;
        value = msg.value;
    }
}

contract A {
    uint public num;
    address public sender;
    uint public value;

    function setVars(address _contract, uint _num) public payable {
        // A's storage is set, B is not modified.
        (bool success, bytes memory data) = _contract.delegatecall(
            abi.encodeWithSignature("setVars(uint256)", _num)
        );
    }
}
