// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {Ether10Donate} from "../src/Ether10Donate.sol";

contract CounterScript is Script {
    Ether10Donate public ether10Donate;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        ether10Donate = new Ether10Donate();

        vm.stopBroadcast();
    }
}
