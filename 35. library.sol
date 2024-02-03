// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

//Libraries are just like contracts, but we can't define state variables in them.
//They help in code reusability

library Math {
    function sqrt(uint y) internal pure returns (uint z) { //square root function defined in a library
        if (y > 3) {
            z = y;
            uint x = y / 2 + 1;
            while (x < z) {
                z = x;
                x = (y / x + x) / 2;
            }
        } else if (y != 0) {
            z = 1;
        }
        // else z = 0 (default value)
    }
}

contract TestMath {
    function testSquareRoot(uint x) public pure returns (uint) {
        return Math.sqrt(x); //using the square root library function
    }
}

// Array function to delete element at index and re-organize the array
// so that there are no gaps between the elements.
library Array {
    function remove(uint[] storage arr, uint index) public {
        // Move the last element into the place to delete
        require(arr.length > 0, "Can't remove from empty array");
        arr[index] = arr[arr.length - 1];
        arr.pop();
    }
}

contract TestArray {
    using Array for uint[]; //this statement associates all of the functions in library array with the data type uint[], making function calls simpler

    uint[] public arr;

    function testArrayRemove() public {
        for (uint i = 0; i < 3; i++) { //loop for creating an array
            arr.push(i);
        }

        arr.remove(1); //notice how the function call has become simpler and more readable due to line 41

        //checks to ensure that the correct element was popped
        assert(arr.length == 2);
        assert(arr[0] == 0);
        assert(arr[1] == 2);
    }
}