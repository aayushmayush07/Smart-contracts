// SPDX-License-Identifier: GPL-3.0


pragma solidity>=0.4.16 <0.9.0;

contract SimpleStorage{
    uint setdigit;

    function set(uint x) public{
        setdigit=x;
    }

    function gety() public view returns(uint){
        return setdigit;
    }
}