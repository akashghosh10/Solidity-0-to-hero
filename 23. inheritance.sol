// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/* Graph of inheritance
    A
   / \
  B   C
 / \ /
F  D,E

*/

//keyword 'virtual' is used with function declarations when we need to specify that a function needs to be modifiable after being inherited
//keyword 'override' is used with function declaration after inheritance when we need to specify that an inehrited function is being modified

//The order from most base-like to most derived for the above graph will be,
//A,B,C,F,D,E
//B and C both derive from A so the order between them doesn't matter
//F derives only from B so it comes before D and E
//D and E derives from B and C so the order between them doesn't matter

contract A {
    function foo() public pure virtual returns (string memory) { //keyword 'virtual' is used to ensure the function is modifiable in the child contract
        return "A";
    }
}

contract B is A { // Contracts inherit other contracts by using the keyword 'is'
    // Override A.foo() to make modification specific to contract B and use 'virtual' as well to inherit the function and modify it in other child contracts
    function foo() public pure virtual override returns (string memory) {
        return "B";
    }
}

contract C is A {
    // Override A.foo()
    function foo() public pure virtual override returns (string memory) {
        return "C";
    }
}

// Contracts can inherit from multiple parent contracts.
// When a function is called that is defined multiple times in
// different contracts, parent contracts are searched from
// right to left, and in depth-first manner.

contract D is B, C {
    // D.foo() returns "C"
    // since C is the right most parent contract with function foo()
    function foo() public pure override(B, C) returns (string memory) {
        return super.foo();

        /*super keyword is used to refer to the immediate parent contract and to use the function implementation
        done in the parent contact inspite of over-riding a function. However, we can explicitly mention contract
        names to call the function as well, like, B.foo() or C.foo(), in inheritance.*/
    }
}

contract E is C, B {
    // since B is the right most parent contract with function foo()
    function foo() public pure override(C, B) returns (string memory) {
        return C.foo(); //This will call the foo() from contract C.
        //Hence, foo() called from contract E will return 'C'
    }
}

// Inheritance must be ordered from “most base-like” to “most derived”.
// Swapping the order of A and B will throw a compilation error.
contract F is A, B {
    function foo() public pure override(A, B) returns (string memory) { //The order of A and B can be swapped here though. It won't make any difference.
        return super.foo(); //This will call the function foo() from both A & B.
        //But, since B is called after A according to the roder of execution, foo() in this contract will return 'B'
    }
}

//If the keyword 'super' is used, it will call the function from from all the parent contracts.