// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

contract FunctionOverloading {
    function sum(uint256 a, uint256 b) external pure returns (uint256) {
        return a + b;
    }

    function sum(
        uint256 a,
        uint256 b,
        uint256 c
    ) external pure returns (uint256) {
        return a + b + c;
    }
}
