// SPDX-License-Identifier: GPL-3.0


pragma solidity>=0.4.16 <0.9.0;



type Duration is uint64;

type Timestamp is uint64;

type Clock is uint128;

library LibClock{
    function wrap(Duration _duration, Timestamp _timestamp) internal pure returns(Clock clock_){
        assembly{
            clock_ := or(shl(0x40, _duration),_timestamp)
        }
    }

    function duration(Clock _clock) internal pure returns(Duration duration_){
        assembly{
            duration_ :=shr(0x40,_clock)
        }


    }

    function timestamp(Clock _clock) internal pure returns(Timestamp timestamp_){
        assembly{
            timestamp_ :=shr(0xC0,shl(0xC0, _clock))
        }
    }
}



//clock library without user defined value type

library LibClockBasic{
    function wrap(uint64 _duration,uint64 _timestamp) internal pure returns(uint128 clock){


        assembly{
            clock := or(shl(0x40,_duration),_timestamp)
        }

    }
}


contract Examples{

    function example_no_uvdt() external view{
        uint128 clock;
        uint64 d=1;
        uint64 t=uint64(block.timestamp);

        clock=LibClockBasic.wrap(d,t);

        clock=LibClockBasic.wrap(t,d);
    }


    function example_uvdt() external view {
        // Turn value type into user defined value type
        Duration d = Duration.wrap(1);
        Timestamp t = Timestamp.wrap(uint64(block.timestamp));
        // Turn user defined value type back into primitive value type
        // uint64 d_u64 = Duration.unwrap(d);
        // uint64 t_u64 = Timestamp.unwrap(t);

        // LibClock example
        Clock clock = Clock.wrap(0);
        clock = LibClock.wrap(d, t);
        // Oops! wrong order of inputs
        // This will not compile
        // clock = LibClock.wrap(t, d);
    }





}