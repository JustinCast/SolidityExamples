// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

contract Parent {
    string public name = "Parent Contract";

    function sayHi() public pure virtual returns (string memory) {
        return "Hi from the parent contract";
    }
}
