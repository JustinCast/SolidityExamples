// SPDX-License-Identifier: MIT

pragma solidity 0.8.21;

contract Token {
    event Transfer(address from, address to, uint value);
    event Approval(address owner, address spender, uint value);

    string public constant name = "JustinCastillo";
    string public constant symbol = "JC";
    uint256 public constant decimals = 1e18;
    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) allowance; // Authorized amount of tokens
    uint256 public totalSupply;

    function transfer(
        address recipient,
        uint256 amount
    ) external returns (bool) {
        balanceOf[msg.sender] -= amount * decimals;
        balanceOf[recipient] += amount * decimals;

        emit Transfer(msg.sender, recipient, amount * decimals);
        return true;
    }

    function approve(address spender, uint256 amount) external returns (bool) {
        allowance[msg.sender][spender] = amount * decimals;
        emit Approval(msg.sender, spender, amount * decimals);
        return true;
    }

    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external returns (bool) {
        allowance[sender][msg.sender] -= amount * decimals;
        balanceOf[sender] -= amount * decimals;
        balanceOf[recipient] += amount * decimals;

        emit Transfer(sender, recipient, amount * decimals);

        return true;
    }

    function mint(uint256 amount) external {
        balanceOf[msg.sender] += amount * decimals;
        totalSupply += amount * decimals;
        emit Transfer(address(0), msg.sender, amount * decimals);
    }

    function burn(uint256 amount) external {
        balanceOf[msg.sender] -= amount * decimals;
        totalSupply -= amount;
        emit Transfer(msg.sender, address(0), amount * decimals);
    }
}
