//SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

contract loops {
    function forLoop(uint n) external pure returns(uint) {
        uint sum;
        for(uint i=0;i<n;i++) {
            sum+=i;
        }
        return sum;
    }

    function whileLoop(uint n) external pure returns (uint) {
        uint sum;
        uint i;
        while(i<n) {
            sum+=i;
            i++;
        }
        return sum;
    }
}