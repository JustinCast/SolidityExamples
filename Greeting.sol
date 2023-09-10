// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

contract Greeting {
    string greeting;

    function storeGreeting(string memory _value) external {
        greeting = _value;
    }

    function deleteGreeting() external {
        greeting = "";
    }

    function concatString() external view returns (string memory _concatString) {
        return string.concat("Hi from the contract ", greeting);
    }

    function retrieveGreeting() external view returns (string memory) {
        return greeting;
    }
}
