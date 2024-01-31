// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

//Interfaces are used to call contracts that are not present in the same solidity file, whose code might be unknown to us or might be very large to copy and paste in our own contract.
//We can declare an interface and define functions in it to use the functions in the contract to be called and then call the interface in our contract.

interface ICounter { //general naming conventions dictate that name of interface should be 'I' with the name of the contract to be called after that.
    function count() external view returns (uint);
    function inc() external;
    //note that we are ending the function declaration in the above lines using a ';' instead of '{}' taht is done normally.
    //Since this is an interface we don't really need to declare the function, it will rather be called from the contract that is being called using interface.
}

contract MyContract { //This is the caller contract
    uint public count;

    function incrementCounter(address _counter) external { //_counter will store the address of the counter contract that is being called.
        ICounter(_counter).inc();
        //Interface can be used by calling the interface using it's name, passing the address of the contract to be called and calling the required function using it.
    }

    function getCount(address _counter) external {
        count = ICounter(_counter).count();
    }

    //note that if the getCount() function is not called, the present value of count in the counter contract won't be visible in the count variable in MyContract
    //if we try to check the value of the count variable in MyContract before calling the geCount() function, even if we have called the increment function, we will see the count as 0.
    //To see the current count, we will have to first call the getCount() function and then check the value of the count variable.
    //To avoid complications, we can capture the present changes in count by capturing the state changes to count in the increment function itself.
}