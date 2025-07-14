// SPDX-License-Identifier: GPL-3.0


pragma solidity>=0.4.16 <0.9.0;

contract ArrayPract{
    uint[] arr;
    uint[] arr1=[1,2,3];
    uint[10] arr2;
    uint[3] arr3=[1,2];

    function getarr() public view returns(uint[3] memory)
    {
return arr3;



    }

    function push(uint element) public {
        arr.push(element);
        arr1.push(element);
        // arr3.push(element); its fixed so array is default to [0,0,0,0,....]
        
        // arr2.push(element); its fixed so array is default to [1,2,0]
    }

    function pop() public {
        arr.pop();
    } 

    function getLength() public view returns(uint){
        return arr2.length;
    }

    function remove(uint index) public {
        delete arr3[index];
    }


    function example() external pure {

        uint[] memory arr4= new uint[](5);

        uint[][] memory arr5=new uint[][](4);

        for (uint i=0;i<arr5.length;i++){
            arr5[i]=new uint[](2);
        }

        arr4[0]=1;
        arr5[0][0]=3;
        // arr5[0][1]=4;

    }

    
}