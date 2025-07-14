// SPDX-License-Identifier: GPL-3.0


pragma solidity>=0.4.16 <0.9.0;


contract StructPract{
    struct FriendsFav{
        string name;
        uint favouriteNum;

    }

    FriendsFav[] friendsfav;

    function get(uint _index) public view returns(string memory,uint){

        FriendsFav memory person=friendsfav[_index];
        return (person.name,person.favouriteNum);


        
    }

    function set(string memory _name, uint _favouriteNumber) public {
        friendsfav.push(FriendsFav(_name,_favouriteNumber));
    }

}