// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract CustomToken is ERC20 {
    address public owner;
    uint256 public startTime;
    uint256 public saleDuration = 7 days; // Example: Sale period is 7 days
    uint256 public constant TOKEN_PRICE = 0.1 ether; // Price per token in ETH

    constructor(uint256 _amount) ERC20("starboyvic", "TRUMP") {
        // Store the deployer's address as the owner
        owner = msg.sender;

        // Mint the specified amount of tokens to the deployer's address
        _mint(msg.sender, _amount);

        // Record the current block timestamp as the start time
        startTime = block.timestamp;
    }

    /**
     * @dev Function that allows only the owner to mint more tokens.
     * @param _amount The number of tokens to mint.
     */
    function ownerMint(uint256 _amount) external {
        // Check if the caller is the owner
        require(msg.sender == owner, "Not the owner");

        // Mint the specified amount of tokens to the owner
        _mint(owner, _amount);
    }

    /**
     * @dev Function that allows the public to buy tokens during the sale period.
     * @param _amount The number of tokens the caller wishes to purchase.
     */
    function buyTokens(uint256 _amount) external payable {
        // Check if the sale period is still active
        require(
            block.timestamp <= startTime + saleDuration,
            "Sale has expired"
        );

        // Check if the correct amount of ETH is sent
        require(
            msg.value == _amount * TOKEN_PRICE,
            "Wrong amount of ETH sent"
        );

        // Mint the specified amount of tokens to the caller
        _mint(msg.sender, _amount);
    }
}
