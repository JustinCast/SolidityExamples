// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

import "./ERC20.sol";

contract ReceiveCustomToken {
    address tokenAddr;

    constructor(address _addr) {
        tokenAddr = _addr;
    }

    function deposit(uint256 amount) external payable {
        ERC20(tokenAddr).transferFrom(msg.sender, address(this), amount);
    }

    function withdraw() external payable {
        uint256 amount = ERC20(tokenAddr).balanceOf(address(this));
        ERC20(tokenAddr).approve(address(this), amount);

        bool success = ERC20(tokenAddr).transferFrom(
            address(this),
            msg.sender,
            amount
        );

        require(success, "Failed to withdraw tokens");
    }
}
