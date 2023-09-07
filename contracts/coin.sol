pragma solidity  ^0.8.17;
// SPDX-License-Identifier: GPL-3.0

contract coin{
    // state variables
    address public minter;
    mapping(address=>uint) balances;
    constructor() {
        minter = msg.sender;
    }
    function mint(address reciever,uint amount) public 
    {
        require(msg.sender==minter,"the user is not the minter");
        balances[reciever] += amount;
    }
    function send(address reciever,uint amount) public
    {
        address sender = msg.sender;
        require(balances[sender]>=amount,"the sender balance is less than the amount");
        balances[reciever] += amount;
        balances[sender] -= amount;
    }
    function balance() public view returns (uint)
    {
        return balances[msg.sender];
    }
}