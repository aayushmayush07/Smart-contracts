//SPDX-License-Identifier:MIT

pragma solidity>=0.4.16 <0.9.0;


contract Bet{
    address payable public  bettorA;
    address payable public bettorB;
    mapping (address=>bool) public sent;
    address payable public  winner;
    uint public betStartTime;
bool public betActive;




    constructor(){

        bettorA=payable(msg.sender);


    }

    function setBettorB(address payable _bettorB) public {
        require(msg.sender==bettorA,"Only owner can choose his opponent");
        bettorB=_bettorB;
        betActive=true;
        betStartTime = block.timestamp;

    }

    function send_eth() payable public{
        require(msg.sender==bettorA || msg.sender==bettorB,"Only the opponents can send the money");
        require(msg.value==10 ether,"You only need to send 10 Eth , neither less nor more");
        require(!sent[msg.sender], "Already deposited");
        sent[msg.sender]=true;


        
    }

    function check_result() public{
        require(msg.sender == bettorA || msg.sender == bettorB, "Only players can call result");
        require(betActive,"The bet has been settled");

        if(2+2==4){
            winner=bettorA;

        }
        else{
            winner=bettorB;
        }
        

    }

    function settle()public{
        require(sent[bettorA]==true && sent[bettorB]==true,"Both needs to send money into escrow wallet first");
        require(winner==bettorA || winner==bettorB,"The winner is not decide yet, click the check result to see and then trigger this function");

        require(betActive,"The bet has been settled");
        winner.transfer(address(this).balance);
        betActive=false;
    }

    function cancelBet() public {
    require(msg.sender == bettorA, "Only bettorA can cancel");
    require(sent[bettorB] == false, "BettorB already deposited");
    require(block.timestamp >= betStartTime + 1 days, "Timeout not reached");
    require(betActive,"The bet has been settled");

    sent[bettorA] = false;
    betActive = false;
    bettorA.transfer(address(this).balance); // refund
}

}