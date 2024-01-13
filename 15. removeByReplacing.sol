//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

//This contract shows how we can delete the elements from an array which
//might reside at any index of the array, by replacing elements.

contract replace {
    uint[] public arr = [1, 2, 3, 4, 5];
    function remove(uint index) external {
        require(index < arr.length, "index is out of bounds"); //the index entered by the user must not be more than the length of the array.
        arr[index]=arr[arr.length-1]; //Replace the eleemt at index with last element.
        arr.pop(); //remove the last element and shrink the array
    }

    //function to return the current array
    function getArray() external view returns(uint[] memory) {
        return arr;
    }
}

//NOTE - This method of replace doesn't preserve the original order of the elements after the removal.
//But this is efficient in terms of gas, in comparison to the shifting method.