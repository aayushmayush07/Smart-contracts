// SPDX-License-Identifier: GPL-3.0
 pragma solidity ^0.8.26;


 contract AkCoin{
    mapping(address=>uint) public balances;
    address public owner;
    event Sent(address from, address to, uint amount);
    constructor(){
        owner=msg.sender;
        balances[owner]=100000;
    } 


    function mint(address receiver,uint amount) public {
        require(msg.sender==owner,"You are not the owner of the contract. You stand no right to mint a coin.");
        balances[receiver]+=amount;


    }


        error InsufficientBalance(uint requested, uint available);

    function send(address receiver,uint amount) public {
        require(balances[msg.sender]>=amount,"You have insufficient amount in your wallet");
        balances[msg.sender]-=amount;
        balances[receiver]+=amount;
         emit Sent(msg.sender,receiver,amount);
    }
 }

