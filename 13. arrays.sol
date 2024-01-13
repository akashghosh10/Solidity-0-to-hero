//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract arrays {
    uint[] public nums = [1, 2, 3]; //dynamic array - size is not fixed

    //For dynamic arrays, the size is dynamically allocated based on the number of elements initialised.
    //If we try to access the element of a dynamic array whose index is more than the size of the array,
    //the transaction will be reverted to the initial state.
    //Ex - uint[] public A = [4,5,6];
    //If we try to access A[3], the transaction will be reverted automatically.

    uint[3] public numsFixed = [4, 5, 6]; //fixed array - size is fixed

    //For fixed arrays, if the number of elements being initialised is more than the declared size, we will get a compilation error.
    //If the number of elements initialised is less than the declared size for a fixed array, the remaining elements are replaced by '0'.
    //Ex - uint[3] public A = [4,5];
    //Here, A[2] will be initialised as 0 as the default value for uint is 0.
    //If we try to access the element of a dynamic array whose index is more than the size of the array, we will get a 'TypeError: Out of bounds array access'.

    function arrayPush(uint a) external {
        nums.push(a); //Creates new index and adds the new element at the end of an array. Can't be used on fixed arrays as their size is fixed.
    }

    function arrayGet(uint index) external view returns (uint x) {
        x = nums[index]; //Access value at an index of the array.
    }

    function arrayUpdate(uint index, uint value) external {
        nums[index] = value; //Update value at an index of the array.
    }

    function arrayDelete(uint index) external {
        delete nums[index]; //Delete value at an index of the array. This does'nt shrink the size of the array. The element deleted is replaced by '0'.
    }

    function arrayPop() external {
        nums.pop(); //Pop the last element of an array. This shrinks the size of an array by 1. So, it can't be used on fixed arrays.
    }

    function arrayLen() external view returns(uint) {
        return nums.length; //returns the length of the array.
    }

    //There are two ways of storing data in Solidity - Storage and Memory.
    //Storage is used for storing something permanent. Ex - State variables and Local Variables of structs, array are always stored in storage by default.
    //Memory is used for storin something temporary. Ex  - Function arguments are in memory.
    //Storing data in storage can be expensive in terms of gas. So, it is better to use memory for doing computations and storing the final result in storage.

    function arrayInMemory() external pure {
        uint[] memory A = new uint[](5); //Creates an array in memory.
        //NOTE - Can't declare arrays or variables in memory outside functions, will raise an error.
    }
    //An array created in memory will alwasy be of fixed size, and hence operations like push and pop can't be used on it.

    function returnNums() external view returns (uint[] memory) {
        return nums;
    }

    function returnNumsFixed() external view returns (uint[3] memory) {
        return numsFixed;
    }

    //NOTE - It is advisable not to return complete arrays, as they are very expensive operations in terms of gas and can use up the gas completely if the array is large in length.

}