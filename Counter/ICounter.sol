// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

interface ICounter {
    function count() external view returns (uint256);

    function increment(uint256 amount) external;
}
