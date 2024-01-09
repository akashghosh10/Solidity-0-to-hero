//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract Functions {
    //external or public functions means that we can call the function after the contract is deployed in a blockchain.
    //public and external differs in terms of gas usage. The former use more than the latter when used with large arrays of
    //data. This is due to the fact that Solidity copies arguments to memory on a public function while external read from
    //calldata which is cheaper than memory allocation.

    //pure function menas that the function is read-only and can't write anything on the blockchain

    function add(uint x, uint y) external pure returns(uint) {
        return x + y;
    }

    function sub(uint x, uint y) external pure returns(uint) {
        return x - y;
    }

    //Both view and pure keywords make a function read-only. However there is a thin of difference between them.
    //If a function reads data associated to the blockchain, it is considered to be a view function.
    //If a function does not read any data associated to the blockchain, it is considered to be a pure function.

    uint public a = 11;
    uint public b = 9;

    //Both a and b are state variables and are stored in the blockchain

    function viewFunc() public view returns(uint) {
        return a + b;  //since this function reads from the blockchain, it is a view function.
    }

    //x and y are local variables and are not stored in the blockchain.
    
    function pureFunc(uint x, uint y) public pure returns(uint) {
        return x + y; //since this function doesn't read from a blockchain, it is a pure function.
    }

    function assigned() public pure returns(uint x, bool y){
        x=1;
        y=true;
        //returns statements can be omitted by using named variables in 'returns' in the function declaration and using them to
        //store values inside the function. This implicitly returns the required values. 
    }

    function destructuredAssignments() public pure {
        (uint x, bool y) = assigned();
        //destructured assignments means using the output from an already existing function in the same contract in the body of
        //another function.
        x++;
        //If only one of the values that a function returns is required, use the following line of code,
        //(, bool y) = assigned();   -   This will take only the boolean output from assigned and assign it to y.
    }
}

// To sum up - 
//External - uses less gas
//Public - uses more gas
//View - reads data from blockchain
//Pure - doesn't read data from blockchain.