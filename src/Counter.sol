// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Counter {
    uint256 public number;  // disimpan di memori/ database website
    uint256 public price;   // anggepannya ini tu variabelnya

    address public owner; // alamat pemilik kontrak
    constructor() {
        owner = msg.sender; // set pemilik kontrak ke alamat yang deploy kontrak
    }

    

    function setPrice(uint256 newPrice) public { // untuk ngubah nilai variabel price
        require(msg.sender == owner, "Only owner can set price"); // hanya pemilik kontrak yang bisa ngubah);
        price = newPrice;
    }

    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }

    function increment() public {
        number++;
    }
}