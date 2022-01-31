// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;
error NotEnoughFounds(uint e, uint e3);
contract Token {
    enum TransectionType{Baki, Nogod, Faw}
    TransectionType   public amarStatus;
    struct User{
        string name;
        uint roll;
    }
    function setAmarStatus() public {
        amarStatus=TransectionType.Nogod;
    }
    mapping(address=>User) public users ;
    function calling() public pure{
        revert NotEnoughFounds(3,5);
    }

    function compire(uint n) public view returns(bool){
        if(n==uint(amarStatus)){
            return true;
        }else{
            return false;
        }
    }
}