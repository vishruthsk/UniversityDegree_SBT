// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Bankcontract{
    struct client_account{
        int id;
        address client_address;
        uint balance;

    }
    client_account[] clients;
    int client_counter;
    address payable manager;
    mapping(address => uint) public interestDate;

    constructor public{
        client_counter=0;

    }
    

    
}



}