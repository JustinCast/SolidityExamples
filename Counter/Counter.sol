// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

import "./ICounter.sol";

contract Counter is ICounter {
    uint256 total = 0;

    function count() external view returns (uint256) {
        return total;
    }

    function increment(uint256 amount) external {
        total += amount;
    }

    function hi() external pure returns (string memory) {
        return "HI";
    }
}
