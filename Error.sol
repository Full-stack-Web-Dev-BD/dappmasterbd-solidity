// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;
error NotEnoughFounds(uint e, uint e3);
contract Token {
    struct User{
        string name;
        uint roll;
    }
    mapping(address=>User) public users ;
    function calling() public pure{
        revert NotEnoughFounds(3,5);
    }
}