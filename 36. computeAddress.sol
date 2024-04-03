// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract computeAddress {
    function recover(address sender) external pure returns (address) {
        address addr = address(uint160(uint256(keccak256(abi.encodePacked(bytes1(0xd6), bytes1(0x94), sender, bytes1(0x01))))));
        return addr;
    }
}

/*
Addresses are deterministic. The address of a contract that is being deployed is computed based on the sender's address
and the nonce, i.e. the number of transactions made by the sender.

address of a contract = last 20 bytes (keccack256(RLP(sender address, nonce)))

RLP stands for Recursive Length Prefix. Recursive Length Prefix (RLP) serialization is used extensively in Ethereum's
execution clients. RLP standardizes the transfer of data between nodes in a space-efficient format. The purpose of RLP is to
encode arbitrarily nested arrays of binary data, and RLP is the primary encoding method used to serialize objects in Ethereum's
execution layer.

For any number less than or equal to 127, the RLP is the number itself in hex. However, for addresses, they will definitely be
larger than 127. So, to denote an address the address is preceded by 0xd6, 0x94.

For example, if the nonce is 1, the address will be,

last 20 bytes (keccack256(RLP(0xd6, 0x94, <sender address>, 0x01)))
= address(uint160(uint256(keccak256(abi.encodePacked(bytes1(0xd6), bytes1(0x94), sender, bytes1(0x01))))))

Here, abi.encodePacked() is functioning as the RLP serializer.

*/