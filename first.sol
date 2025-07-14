// SPDX-License-Identifier: GPL-3.0


pragma solidity>=0.4.16 <0.9.0;

contract SimpleStorage{
    uint storedvar;

    function set(uint x) public{
        storedvar=x;
    }

    function get() public view returns(uint){
        return storedvar;
    }
}



