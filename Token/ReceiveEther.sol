// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

import "hardhat/console.sol";

contract ReceiveEther {
    // Function to receive ether || msg.data must be empty
    receive() external payable {
        console.log("Receive called");
    }

    fallback() external payable {
        console.log("Fallback called");
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
