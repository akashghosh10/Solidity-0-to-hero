// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Receiver {
    event Received(address caller, uint amount, string message);

    fallback() external payable {
        emit Received(msg.sender, msg.value, "Fallback was called");
    }

    function foo(string memory _message, uint _x) public payable returns (uint) {
        emit Received(msg.sender, msg.value, _message);

        return _x + 1;
    }
}

contract Caller {
    event Response(bool success, bytes data);

    // Let's imagine that contract Caller does not have the source code for the
    // contract Receiver, but we do know the address of contract Receiver and the function to call.
    function testCallFoo(address payable _addr) public payable {
        
        (bool success, bytes memory data) = _addr.call{value: msg.value}( // To specify a custom gas amount along with ether as well, use gas: <amount of gas to be sent> after value: msg.value
            abi.encodeWithSignature("foo(string,uint256)", "call foo", 123)
        );

        //syntax for abi.encodeWithSignature() -
        //abi.encodeWithSignature("<name of original function being called>(<input data types for original function>)", <inputs to be given to the original function when called>)
        //Notice that the input datatype for uint has been specified as uint256 instead of just uint
        
        emit Response(success, data);
    }

    // Calling a function that does not exist triggers the fallback function.
    function testCallDoesNotExist(address payable _addr) public payable {
        (bool success, bytes memory data) = _addr.call{value: msg.value}(
            abi.encodeWithSignature("doesNotExist()") //Calling this non-existent function will trigger fallback
        );

        emit Response(success, data);
    }
}
