// SPDX-License-Identifier: GPL-3.0


pragma solidity>=0.4.16 <0.9.0;

contract ReadWriteStateVariable{
    uint variable=5;

    function set (uint new_variable) public{
        variable=new_variable;
    }

    function get() public view returns(uint ){
        return variable;
    }
}