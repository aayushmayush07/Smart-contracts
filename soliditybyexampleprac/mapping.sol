// SPDX-License-Identifier: GPL-3.0


pragma solidity>=0.4.16 <0.9.0;


contract MappingPractice{
    mapping(address=>uint256) balances;

    function set(address add, uint256 bal) public{

        balances[add]=bal;

    }

    function get(address add) public view returns(uint){
        return balances[add];
    }

    
}