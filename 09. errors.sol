//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

//Like any other language, Solidity also has ways to handle errors during the execution of a program.
//There are 3 ways of catching errors -
//require - Use require when you need to validate inputs, preconditions, or invariants that must be true
//          for the function to execute correctly. require is commonly used to check for valid inputs, valid state,
//          and authorization requirements.
//revert - Use revert when an error occurs that is not caused by an external call, such as an out-of-gas condition
//         or a failed internal assertion. Revert is often used to roll back state changes and provide a meaningful error message
//         to the user.
//assert - Use assert when an internal error occurs that should never happen if the program is correct. Assert is typically
//         used to check for bugs, invariant violations, and other conditions that indicate a programming error.
//When an error is thrown, the remaining gas will be refunded and any changes to the state variables will be reverted.
//Custom errors can also be used to save gas.

contract errors{

    function divideRequire (uint a, uint b) external pure returns (uint) {
        require(b != 0, "Division by zero");
        return (a/b);
    }

    function divideRevert (uint a, uint b) external pure returns (uint) {
        if (b == 0) {
            revert ("Division by Zero!");
        }
        return (a/b);
    }

    function add(uint256 a, uint256 b) public pure returns (uint256) {
        uint256 c = a + b;
        assert(c >= a); //Checks for integer overflow.
        return c;
    }

    error myError (address caller, uint i); //Declaration of custom error

    function customErrors (uint dividend, uint divisor) external view returns (uint) {
        if (divisor == 0) {
            revert myError (msg.sender, divisor); //Use of custom error.
        }
        return (dividend/divisor);
    }
}