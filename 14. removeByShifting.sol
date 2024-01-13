//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

//the delete functioanlity of an array doesn't really delete the element,
//it just replaces it by the default value (like 0 for uint).
//Whereas, pop can only delete elements from the end of an array.
//This contract shows how we can delete the elements from an array which
//might reside at any index of the array, by shifting elements.

contract shift {
    uint[] public arr = [1, 2, 3, 4, 5];
    function remove(uint index) external {
        require(index < arr.length, "index is out of bounds"); //the index entered by the user must not be more than the length of the array.
        for(uint i = index; i<(arr.length)-1; i++) {
            arr[i]=arr[i+1]; //shift elements from right to left till we reach index = length - 2 (last index of array after removal of element)
        }
        arr.pop(); //remove the last element and shrink the array
    }

    //function to return the current array
    function getArray() external view returns(uint[] memory) {
        return arr;
    }
}

//special case - remove element from array with only one element.
//[1] -> []
//array becomes empty after the removal (length = 0).

//NOTE - This method is less efficient in terms of gas in comparison to the replace method,
//but can preserve the original order of the elements after the removal.