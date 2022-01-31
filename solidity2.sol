// SPDX-License-Identifier:GPL-3.0
pragma solidity 0.8.0; 
contract Subcurrency{
    address admin;
    mapping(address=>uint)  public balances;
    event Sent(address from , address to , uint amount);
    constructor(){
        admin=msg.sender;
    }
    function mint(address to, uint amount) public {
        require(msg.sender ==admin, "Validation faild");
        balances[to]+=amount;
    }
    function send(address to, uint amount) public {
        require(balances[msg.sender]>amount,"Insufficient balance");
        balances[msg.sender]-=amount;
        balances[to]+=amount;
        emit Sent(msg.sender, to, amount);
    }
}