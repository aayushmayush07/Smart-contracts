// SPDX-License-Identifier: GPL-3.0


pragma solidity>=0.4.16 <0.9.0;

// Create a smart contract that stores a non-negative integer.
// The contract should allow:

// Reading the current value.

// Increasing the value by one.

// Decreasing the value by one.

contract SeeIncrementDecrement {
    uint  public num;

    function get() public view returns(uint){
        return num;
    }

    function increment() public {
        num=num+1;
        
    }

    function decrement() public{
        num=num-1;
 
    }    
}