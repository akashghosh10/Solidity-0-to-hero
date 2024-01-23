// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

//Base contract X
contract X {
    string public name;

    constructor(string memory _name) {
        name = _name;
    }
}

//Base contract Y
contract Y {
    string public text;

    constructor(string memory _text) {
        text = _text;
    }
}

//There are 2 ways to initialize parent contract with parameters -

//Pass the parameters here in the inheritance list. This is used for static allocation of values to variables.
contract B is X("Input to X"), Y("Input to Y") {

}

contract C is X, Y {
    //Pass the parameters here in the constructor, similar to function modifiers.
    //This is used for dynamic allocation of values to variables.
    constructor(string memory _name, string memory _text) X(_name) Y(_text) {}
}

//Parent constructors are always called in the order of inheritance regardless
//of the order of parent contracts listed in the constructor of the child contract.

// Order of constructors called: X,Y,D
contract D is X("X was called"), Y {
    constructor() Y("Y was called") {}
}
//We can mix the 2 ways of calling constructors together as well.

// Order of constructors called: X,Y,E
contract E is X, Y {
    constructor() Y("Y was called") X("X was called") {}
}