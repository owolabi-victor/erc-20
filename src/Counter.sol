// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

/**
 * @title Counter
 * @dev A simple contract that increments and sets a number.
 */
contract Counter {
    uint256 private _number;

    /**
     * @dev Sets the initial number.
     * @param num The initial value of the number.
     */
    function setNumber(uint256 num) external {
        _number = num;
    }

    /**
     * @dev Increments the number by 1.
     */
    function increment() external {
        _number += 1;
    }

    /**
     * @dev Returns the current value of the number.
     * @return The current number.
     */
    function number() external view returns (uint256) {
        return _number;
    }
}
