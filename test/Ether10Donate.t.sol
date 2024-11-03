// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import {Test, console} from "forge-std/Test.sol";
import {Ether10Donate} from "../src/Ether10Donate.sol";

contract Ether10DonateTest is Test {
    Ether10Donate   myEtherDonate;
    Ether10Donate.Doner donerStructVar;

    function setUp() public {
        myEtherDonate = new Ether10Donate();
        
        myEtherDonate.AcceptDonations(5, address(this), "Ali");
       
       
    }

    function testAcceptDonations() public {
         myEtherDonate.getDoners();
         console.log("from testAcceptDonations: msg sender:", msg.sender);
        //  console.log("from testAcceptDonations: msg sender:", myEtherDonate.getDoners());
        // assertEq(ether10Donate.number(), 1);
    }

     
}
