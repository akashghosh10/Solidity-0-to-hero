//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

//A mapping is like a dictionary in Solidity. It is used to store key-value pairs.
//Arrays can also be used to store data, but mappings are more efficient when searching needs to be done.
//The number of lookups needed to be done is more in arrays as we will need to iterate through the elements of the array till we find the required element.
//However, for mappings, only one lookup is required to search for a key.
//But, mappings are not iterable, neither can we find their size using any function like arrays.

contract mappings {
    mapping(address => uint) public balances;
    //A mapping is declared with the data-types of it's key-value pair. In this case, the key is of type address and it's value is of type integer.
    //This will be used to store a address and the balance present in that address, hence the uint for the value.

    mapping(address => bool) public inserted; //This will be used to check if the balances for an address have been stored
    
    address[] public keys; //This will be used to keep a track of all the addresses that have been stored in the balances mapping

    modifier isInserted(address _key) {
        if(!inserted[_key]) { //check if _key is already present in mapping inserted, to confirm if it is a new key.
            keys.push(_key); //If _key is not present in mapping inserted, push it to keep track of all addresses being stored.
            inserted[_key] = true; //set inserted for the key _key to true
            _;
        }
    }

    modifier cap(uint _i) {
        require(_i<keys.length);
        _;
    }

    function setBalances(address _key, uint _val) external isInserted(_key) {
        balances[_key] = _val; //assign _val as the balance of address _key.
        
    }

    function getSize() external view returns(uint x) { //get size of the mapping keys, which is the same as the size of balances.
        x = keys.length;
        //NOTE - not using return statement for saving gas.
    }

    function first() external view returns(uint x) { //get balance of first address stored
        x = balances[keys[0]];
    }

    function last() external view returns(uint x) { //get balance of last address stored
        x = balances[keys[keys.length - 1]];
    }

    function getBalances(uint _i) external view returns(uint x) { //get balance of _ith address stored
        x = balances[keys[_i]];
    }

    function deleteBalances(uint _i) external { //delete the balance for _ith address stored
        delete balances[keys[_i]];
        //deleteing a value for a key, doesn't remove the key in a mapping.
        //It will just set it's value to the default value.
    }

    function increment(uint _i, uint _val) external cap(_i) { //increment balance stored in keys[_i] by _val
        balances[keys[_i]] += _val; 
    }

    function decrement(uint _i, uint _val) external cap(_i) { //decrement balance stored in keys[_i] by _val
        balances[keys[_i]] -= _val; 
    }

    //using function modifiers to save energy :)

    //Now, using the size of the array keys[] we can easily define a for loop to iterate through the values stored in the mapping balances.
    //The length of the mapping balances can also be found using the length of the array keys[], as has been used in the smart contract.

    //mapping(address => mapping(address => bool)) public isFriend;
    //This is an example of a nested mapping. This will be used to check if an address is a friend of another address.
    //to set the value of this nested mapping, we can do the following :
    //isFriend[msg.sender][address(this)] = true
}