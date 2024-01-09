//SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

contract DataTypes {
    //There are 2 data types in Solidity - Values & References
    //values store some sort of value like uint, bool, etc.
    //references do not store any value but a reference, to the address where some data is stored, like arrays.
    bool public b = true;
    uint public u = 123;
    int public i = -123;
    //The below statements can be used to find out the maximum and minimum possible values for a particular datatype.
    uint public minInt = type(uint).min;
    int public maxInt = type(int).max;
    //Other values like address and bytes32 are also used very popularly.
}