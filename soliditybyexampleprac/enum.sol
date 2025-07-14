// SPDX-License-Identifier: GPL-3.0


pragma solidity>=0.4.16 <0.9.0;

contract EnumPract{
    enum Status{
        Pending,
        Shipped,
        Accepted,
        Rejected,
        Canceled
    }


    Status public status;

    function get() public view returns(Status){
        return status;
    }

        // Update status by passing uint into input
    function set(Status _status) public {
        status = _status;
    }

        // You can update to a specific enum like this
    function cancel() public {
        status = Status.Canceled;
    }

    // delete resets the enum to its first value, 0
    function reset() public {
        delete status;
    }

}