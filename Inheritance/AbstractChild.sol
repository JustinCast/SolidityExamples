// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

import "./Abstract.sol";

contract AbstractChild is Abstract {
    function sayHi() internal pure override returns (string memory) {
        return "Abstract Child";
    }
}
