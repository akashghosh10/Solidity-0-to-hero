//SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

contract IfElse {
    function condition(uint x) external pure returns(uint) {
        if (x < 10) {
            return 1;
        }
        else if (x < 20) {
            return 2;
        }
        else {
            return 0;
        }
        //The last else statement can be replaced by a single return statement under the function as well, like any other language.
    }

    function ternary(uint x) external pure returns (uint) {
        return x<10 ? 1 : 2;
    }
}