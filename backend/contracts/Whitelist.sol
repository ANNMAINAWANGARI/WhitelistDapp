//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Whitelist {
    uint8 public maximumWhitelistedAddresses;
    //if an adddress is whitelisted set it to true
    mapping(address=>bool) public whitelistedAddresses;
    uint8 public numAddressesWhitelisted;
    constructor(uint8 _maximumWhitelistedAddresses){
     maximumWhitelistedAddresses = _maximumWhitelistedAddresses;
    }
    function addAddressToWhiteList() public {
     require(!whitelistedAddresses[msg.sender], 'You are already whitelisted');
     require(numAddressesWhitelisted<maximumWhitelistedAddresses, 'The number of whitelisted addresses has been exhausted');
     whitelistedAddresses[msg.sender] = true;
     numAddressesWhitelisted += 1;

    }
}