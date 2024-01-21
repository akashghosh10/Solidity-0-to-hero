// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

//This contract simply tries to explain and show how storage, memory and calldata works.
//To recap,
//storage is for storing something permamnently and can be expensive on gas
//memory is for storing something temporarily in the local scope and is comparatively cheaper on gas
//calldata is used for function inputs and is the cheapest on gas

contract simpleStorage {
    string public text; //storage by default

    function set_call(string calldata _text) external { //execution cost   23205 (input = "hello")
        text = _text; //copeid from calldata to storage.
    }

    function set_mem(string memory _text) external { //execution cost   23688 (input = "hello")
        text = _text; //copied from memory to storage
    }

    function get() external view returns(string memory){ //we need to declare the return type as memory for dynamic data types like strings, arrays, etc.
        return text;
    }
}

//By default,
//All variable declarations done in the global scope is storage
//All variable declarations done for functions or in the local scope are memory
//Calldata needs to be specified explicitly and are used for memory reduced operations