// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Callee { //contract that will be called by another caller function
    uint public x;
    uint public value;

    function setX(uint _x) public returns (uint) {
        x = _x;
        return x;
    }

    function setXandSendEther(uint _x) public payable returns (uint, uint) {
        x = _x;
        value = msg.value;

        return (x, value);
    }
}

contract Caller { //contract that will call the callee function
    //There are many ways of calling a contract. Check the following functions to understand them.

    function setX(Callee _callee, uint _x) public { //here, we are passing the address of the callee contract as type 'Callee', i.e. the callee contract. _callee is the address.
        _callee.setX(_x); //_callee stores the address of the callee contract which is being used to call the setX function from the same contract.
    }

    function setXFromAddress(address _addr, uint _x) public { //_addr is the address of the callee function
        Callee callee = Callee(_addr); //calling the 'Callee' contract stored in address '_addr'
        //and assigning it to variable callee of type Callee(contract name is used as type here)
        callee.setX(_x); //using variable 'callee' to call setX by passing _x
    }

    function setXandSendEther(Callee _callee, uint _x) public payable returns(uint x, uint value){
        (x, value) = _callee.setXandSendEther{value: msg.value}(_x); //
        //when multiple values are returned by a function, it can be assined to multiple variables as shown
    }
}
