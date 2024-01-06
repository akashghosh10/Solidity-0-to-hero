//SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

contract variableTypes {
    //There are mainly 3 types of variables -

    //1. State variables - They are defined outside functions and are used to store data in the blockchain. Once created, they
    //can't be deleted and exist in the blockchain permanently.

    uint public i;
    bool public b = false;
    address public myAddress;

    //2. Local variables - They are defined inside functions, i.e. in a local namespace and are used only in that particular
    //namespace. They cease to exist once the function execution is complete.

    function localVars() external returns(uint){
        uint x = 5;
        uint y = 6;
        uint sum = x + y;
        i = 10;
        b = true;
        myAddress = address(1);
        return (sum);
    }

    //3. Global variables - These are used to gain special info about the blockchain like timestamp of a function call,
    //block number, address of the sender, etc.

    function globalVars () external view returns (address, uint, uint) {
        address sender = msg.sender;
        uint timestamp = block.timestamp;
        uint blockNum = block.number;
        return (sender, timestamp, blockNum);
    }
}