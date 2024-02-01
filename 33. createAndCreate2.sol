// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

//the 'new' keyword creates a new contract using any inputs given and deploys it.

contract Car { //new contracts will be deployed based on this contract
    address public owner;
    string public model;
    address public carAddr;

    constructor(address _owner, string memory _model) payable {
        owner = _owner;
        model = _model;
        carAddr = address(this);
    }
}

contract CarFactory { //contract to deploy new contracts
    Car[] public cars; //array to keep track of all deployed contracts

    function create(address _owner, string memory _model) public {
        Car car = new Car(_owner, _model); //creating and deploying new contract car by invoking the constructor. The details of this contract will also be stored in variable 'car'
        cars.push(car); //pushing the newly created car to the array cars
    }

    function createAndSendEther(address _owner, string memory _model) public payable { //this function needs to be payable so that we can send some ether to this function when calling it so that this function in turn sendsthat ether to the constructor
        Car car = (new Car){value: msg.value}(_owner, _model); //since the constructor defined in contract 'car' is payable, we can send ether to the deployed contract as well
        cars.push(car);
    }

    //create2 is similar to create in which we use the new keyword, except the fact that it deterministically precomputes the contract address
    //salt is a number of our choice used to define the address in which the contract will be deployed. Check keccack256 Hash and how to precompute the address of a contract for more details.
    function create2(address _owner, string memory _model, bytes32 _salt) public {
        Car car = (new Car){salt: _salt}(_owner, _model);
        cars.push(car);
    }

    function create2AndSendEther(
        address _owner,
        string memory _model,
        bytes32 _salt
    ) public payable {
        Car car = (new Car){value: msg.value, salt: _salt}(_owner, _model);
        cars.push(car);
    }

    function getCar(uint _index) public view returns (address owner, string memory model, address carAddr, uint balance){
        Car car = cars[_index];

        return (car.owner(), car.model(), car.carAddr(), address(car).balance);
    }
}
