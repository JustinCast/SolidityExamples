// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

abstract contract Abstract {
    function sayHi() internal pure virtual returns (string memory);

    function sum(uint256 a, uint256 b) external pure returns (uint256) {
        return a + b;
    }
}
