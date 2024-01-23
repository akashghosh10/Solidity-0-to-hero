// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Event {

    //An event is declared when we need to store something in the blockchain permamnently, i.e. log it.
    //However, we won't be able to retrieve it from the blockchain, but we can only search for it using indexed parametersand get what was emitted, as in logged.
    
    // Indexed parameters helps you filter the logs by the indexed parameter and search for them
    event indexedLog(address indexed sender, string message);
    //NOTE - Up to 3 parameters can be indexed in an event declaration.
    
    event log(); //Indexing is not mandatory for creating an event, but it helps in searching for it.

    function test() public {
        //the emit keyword is used to store an event in the blockchain
        emit indexedLog(msg.sender, "Hello World!");
        emit indexedLog(msg.sender, "Hello EVM!");
        emit log();
    }
}
