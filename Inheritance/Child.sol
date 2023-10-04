// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

import "./Parent.sol";
import "./Relative.sol";

contract Child is Relative, Parent {
    constructor() {
        name = "No, I'm the child contract";
    }

    function sayHi()
        public
        pure
        virtual
        override(Parent, Relative)
        returns (string memory)
    {
        return "Hi from the child contract";
    }

    function getBlockTimestamp() internal virtual returns (uint256 timestamp) {
        return block.timestamp;
    }
}

// RELATIVE - PARENT
//      CHILD
//    GRANDCHILD
