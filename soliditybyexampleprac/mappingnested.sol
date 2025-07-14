// SPDX-License-Identifier: GPL-3.0


pragma solidity>=0.4.16 <0.9.0;

contract MappingNestedPrac{
    mapping(address=>mapping (uint=>bool)) balancebool;


    function set(address add, uint bal, bool _b) public {

        balancebool[add][bal]=_b;

    }

    function get(address add, uint bal) public view returns(bool){
        return balancebool[add][bal];
    }
}