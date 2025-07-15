// SPDX-License-Identifier: GPL-3.0


pragma solidity>=0.4.16 <0.9.0;





contract EventDrivenArchitecture{

    event TransferInitiated(
        address indexed from, address indexed to, uint value

    );


    event TransferConfirmed(
        address indexed from, address indexed to, uint value

    );

    mapping(bytes32 => bool) public transferConfirmations;

    function initiateTransfer(address to, uint256 value) public{
        emit TransferInitiated(msg.sender,to,value);
    }


    function confirmTransfer(bytes32 transferId) public{
        require(
            !transferConfirmations[transferId],"Transfer already confirmed"
        );

        transferConfirmations[transferId]=true;

        emit TransferConfirmed(msg.sender,address(this),0);


    }





}