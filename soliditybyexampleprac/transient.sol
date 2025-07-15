// SPDX-License-Identifier: MIT


pragma solidity>=0.4.16 <0.9.0;



interface ITest{
    function val() external view returns(uint256);
    function test() external;
}


contract Callback{
    uint256 public val;

    fallback() external{

        val=ITest(msg.sender).val();

    }

    function test(address target) external{

        ITest(target).test();

    }


}

contract TestStorage{

    uint256 public val;

    function test() external{
        val=456;
        msg.sender.call("");
    }
}


contract TestTransientStorage{
    bytes32 constant SLOT=0;

    function test() public{
        assembly{
            tstore(SLOT,321)
        }

        msg.sender.call("");
    }

    function val() public view returns(uint256 v){
        assembly{
            v:= tload(SLOT)
        }
    }
}