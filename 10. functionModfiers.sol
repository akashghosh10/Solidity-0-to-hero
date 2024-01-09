//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract counter {
    uint public count;
    bool public paused;

    function setPause(bool _paused) external {
        paused = _paused;
    }

    //function modifiers help in reusing code by wrapping up a piece of code which is being used repeatedly inside a modifier,
    //and using the modifier in the function instead.
    modifier whenNotPaused() {
        require(!paused, "Paused"); //instead of using this line of code repeatedly in every function, we declare it in a function modifier.
        _; //this line asks the compiler to start executing the function.
    }

    //using the modifier name in the function declaration, to use the code defined in the modifier before the code in the function
    //is executed.
    function inc() external whenNotPaused {
        count+=1;
    }

    function dec() external whenNotPaused {
        count-=1;
    }

    //modifiers can take inputs as well, as shown below.
    modifier cap(uint a) {
        require(a<100, "input is greater than 100");
        _;
        count*=2; //this is known as 'sandwich'. The first line of the modifier is executed when it is called with the fuction,
        //then the function is executed, the the compiler returns to the modifier again and the code after '_;' is executed then.
    }

    function incBy(uint a) external cap(a) {
        count+=a;
    }
}