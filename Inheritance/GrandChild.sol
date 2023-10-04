// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

import "./Child.sol";

contract GrandChild is Child {
    function sayHi() public pure override returns (string memory) {
        return super.sayHi();
    }

    function getBlockTimestamp() internal override returns (uint256 timestamp) {
        return super.getBlockTimestamp();
    }

    function aux() external returns (uint256) {
        return getBlockTimestamp();
    }
}
