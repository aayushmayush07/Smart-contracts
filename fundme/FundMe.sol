// Get Funds from users
// Withdraw funds
//Set a minimum funding value in USD that is 5 dollar


//SPDX-License-Identifier:MIT

pragma solidity>=0.4.16 <0.9.0;
import {PriceConvertor} from "./PriceConvertor.sol";
error NotOwner();

contract FundMe{
    using PriceConvertor for uint256;
    address  public owner;

    uint256 public myValue=1;
    uint public minimumUsd=5 * 1e18;
    address[] public funders;
    mapping(address=>uint256) public addressToAmountFunded;


    constructor(){
        owner=msg.sender;

    }
    function fund() public payable {
        // msg.value.getConversionRate();




        require(msg.value.getConversionRate()>=minimumUsd,"Didn't sent enough ETH");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender]=addressToAmountFunded[msg.sender]+msg.value;










    }//anybody can fund


    function withdraw() public onlyOwner{
        

        for(uint index=0; index<funders.length;index++){
            address add=funders[index];
            addressToAmountFunded[add]=0;

        }


    funders = new address[](0);

    //transfer (return error if fails and revert)
    payable(msg.sender).transfer(address(this).balance);


    //send(returns bool if fails)
    // bool sendSuccess=payable(msg.sender).send(address(this).balance);

    // require(sendSuccess,"Send failed");//it will only revert if require is present

    //call(returns bool, recommended)
    (bool callSuccess,)=payable(msg.sender).call{value:address(this).balance}("");
    require(callSuccess,"Call failed");










    } 


    modifier onlyOwner(){

if(msg.sender!=owner){
    revert NotOwner();
}
_;
    }


    //What happens if someone sends this contract ETH without calling the fund function


    receive() external payable{
        fund();
    }
    fallback() external payable{
        fund();
    }





   








}