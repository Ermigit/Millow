// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.17;

contract Play {
    uint public x;
    constructor() {
     x = 1;  
    }
    function setX(uint _x) public{
        x = _x;
    }
}

