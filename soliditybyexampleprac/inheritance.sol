// SPDX-License-Identifier: GPL-3.0


pragma solidity>=0.4.16 <0.9.0;


contract A{
    function foo() public pure virtual returns (string memory){
        return "A";
    }
}


contract B is A{
    function foo() public pure virtual override returns(string memory){
        return "B";
    }

    
}

contract C is A {
    // Override A.foo()
    function foo() public pure virtual override returns (string memory) {
        return "C";
    }
}

contract D is B, C {
    // D.foo() returns "C"
    // since C is the right most parent contract with function foo()
    function foo() public pure override(B, C) returns (string memory) {
        return super.foo();
    }
}



contract E is C,B{
    // D.foo() returns "C"
    // since C is the right most parent contract with function foo()
    function foo() public pure override(B, C) returns (string memory) {
        return super.foo();
    }
}


contract F is A,B {
    function foo() public pure override(A, B) returns (string memory) {
        return super.foo();
    }
}