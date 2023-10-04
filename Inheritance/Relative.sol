// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

contract Relative {
    function sayHi() public pure virtual returns (string memory) {
        return "Hi from the relative contract";
    }
}
