// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract HashFunction {
    function hash(string memory _text, uint _num, address _addr) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(_text, _num, _addr)); //use abi.encodePacked() to convert the input into bytes32
    }

    //Hash collision is when 2 different inputs generate the same hash for the same hashing algorithm
    //encode will return bytes
    //encodePacked will return bytes in a compressed form
    // Hash collision can occur when you pass more than one dynamic data type
    // to abi.encodePacked. In such case, you should use abi.encode instead.
    function collision(
        string memory _text,
        string memory _anotherText
    ) public pure returns (bytes32) {
        // Example of hash collision
        // encodePacked(AAA, BBB) -> AAABBB
        // encodePacked(AA, ABBB) -> AAABBB
        return keccak256(abi.encodePacked(_text, _anotherText));
    }
}

contract GuessTheMagicWord {
    bytes32 public answer =
        0x60298f78cc0b47170ba79c10aa3851d7648bd96f2f8e46a19dbc777c36fb0c00;

    // Magic word is "Solidity"
    function guess(string memory _word) public view returns (bool) {
        return keccak256(abi.encodePacked(_word)) == answer;
    }
}

/*A possible fix for hash collision is to use a static data type,
like uint between two dynamic data types,
for example - abi.encodePacked(text0, x, text1),
here x can be an input of type uint
We can aslo use encode instead of encodePacked to avoid hash collision.*/
