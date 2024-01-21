// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract DataLocations {

    struct MyStruct {
        uint foo;
        string text;
    }

    mapping(address => MyStruct) public myStructs;

    function example1() external returns(MyStruct memory){
        myStructs[msg.sender] = MyStruct({foo: 123, text: "bar"});

        MyStruct storage myStruct = myStructs[msg.sender]; //creating a copy of the element from mapping myStructs with key as the address msg.sender in storage, to update one of it's fields
        myStruct.text = "foo1"; //notice that myStruct has been declared in storage, otherwise, the changes will not be saved.

        MyStruct memory readonly = myStructs[msg.sender]; //creating a copy of the element from mapping myStructs with key as the address msg.sender in memory, to read it's value. This variable will be deleted once the function execution is completed.
        return readonly;
    }

    function example2(uint[] calldata y) external returns(uint[] memory){
        //when a variable is declared as calldata, it basically becomes immutable, and is used to access function inputs
        //using calldata helps in saving gas.
        myStructs[msg.sender] = MyStruct({foo: 456, text: "bar"});

        MyStruct storage myStruct = myStructs[msg.sender];
        myStruct.text = "foo2";

        MyStruct memory readonly = myStructs[msg.sender];
        readonly.foo = 456;

        _internal(y);

        uint[] memory memArr = new uint[](3);
        memArr[0] = 234;
        return memArr;
    }

//When the below function is called inside example2(), since we are using calldata, the input parameter y is directly used.
//If we had used memory, the input data would have been copied to memory from example2() input using up some space,
//and then it would be given as input to _internal() call inside example2(). Hence using a lot of gas. 

    function _internal(uint[] calldata y) private pure {
        uint x = y[0];
    }
}

//To sum up,
//Storage - used to store state variables and other permamnent stuff. Can be expensive on gas.
//Memory - used to store data in the local scope like during a function execution. Everything declared in memory is deleted after the function execution is completed. Cheap in terms of gas.
//Calldata - used to store inputs to functions and makes the variable immutable as well. Cheapest in terms of gas.
//NOTE - Try to use memory and calldata and avoid using storage unless absolutely necessary to save up on gas.