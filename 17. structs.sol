//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

//structs are used for storing groups of data.

contract structs {
    struct car {
        string model;
        uint year;
        address owner;
    }

    car public myCar; //struct as a state variable
    car[] public carArray; //array of struct car
    mapping(address => car[]) public carsByOwner; //mapping to map a particular owner to multiple cars owned by him, hence the array type struct

    function initialiseStruct() external {

        //There are 3 ways of initialising a struct

        car memory toyota = car("Toyota", 1990, msg.sender); //order is very important in this initialisation, the values should be provided in the same order as the struct declaration

        car memory lambo = car({year: 1980, model: "Lamborghini", owner: msg.sender}); //if initialisation is done using the key value pairs, order doesn't matter as shown here

        //initialisation can also be done by seperately updating the fields
        car memory tesla;
        tesla.model = "Tesla";
        tesla.year = 2020;
        tesla.owner = msg.sender;

        //NOTE - the structs have been initialised in the memory here. So, we can push that to the array as shown below

        carArray.push(toyota);
        carArray.push(lambo);
        carArray.push(tesla);

        //NOTE - it is not necessary to initialise a struct in memory explicitly, it can be directly pushed in the array as shown below.

        carArray.push(car("Ferrari", 2020, msg.sender));
    }

    function getStruct(uint _i) external view returns(string memory _model, uint _year, address _owner){ //memory is used for string, otherwise getting error
        car memory _car = carArray[_i]; //fetching struct stored in _ith index of array
        
        //retrieving details from _car
        _model = _car.model;
        _year = _car.year;
        _owner = _car.owner;        
    }

    function updateStruct(uint _i, string memory _model, uint _year) external {
        car storage _car = carArray[_i]; //needs to be storage, to retain data after function execution is completed
        
        //changing details
        _car.model = _model;
        _car.year = _year;        
    }

    function deleteStruct(uint _i) external {
        delete carArray[_i];
    }
}