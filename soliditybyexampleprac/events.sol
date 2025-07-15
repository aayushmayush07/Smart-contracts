// SPDX-License-Identifier: GPL-3.0


pragma solidity>=0.4.16 <0.9.0;



contract Event{
    event Log(address indexed sender, string message);

    function test() public{
        emit Log(msg.sender,"Hello world");
        emit Log(msg.sender,"Hello EVM!");
    }
}

