// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/console.sol"; // Add this import
import {CustomToken} from "../src/CustomToken.sol";

contract Deploy is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        // Start the deployment broadcast
        vm.startBroadcast(deployerPrivateKey);

        // Deploy the contract with an initial supply of 1,000 tokens
        CustomToken token = new CustomToken(1000000000 * 10**18);

        console.log("Contract deployed at:", address(token)); // Now works!

        vm.stopBroadcast();
    }
}
