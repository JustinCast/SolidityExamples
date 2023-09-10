// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

contract GreetingMultiple {
    event UserDeleted(address user, string message, uint256 timestamp);
    uint256 public constant MAX_GREETINGS = 5;
    enum Status {
        Open,
        Closed
    }
    struct Data {
        string[] greetings;
        uint256 timestamp;
        Status status;
    }
    mapping(address => Data) usersGreetings;

    function updateStatus() internal {
        Data storage data = usersGreetings[msg.sender];

        uint256 length = usersGreetings[msg.sender].greetings.length;

        if(length == MAX_GREETINGS)
            data.status = Status.Closed;
    }

    function storeGreeting(string memory _greeting) external {
        Data storage data = usersGreetings[msg.sender];

        require(data.status == Status.Open, "You can't post any more greetings");

       data.greetings.push(_greeting);
        data.timestamp = block.timestamp;

        updateStatus();
    }

    function deleteGreeting(uint256 index) external {
        string[] storage _greetings = usersGreetings[msg.sender].greetings;
        
        _greetings[index] = _greetings[_greetings.length - 1];
        _greetings.pop();
    }

    function deleteUser() external {
        delete usersGreetings[msg.sender];
        emit UserDeleted(msg.sender, "User deleted", block.timestamp);
    }

    function getGreetings(address addr) external view returns (string[] memory) {
        return usersGreetings[addr].greetings;
    }

    function retrieveGreeting(address addr) external view returns (Data memory) {
        return usersGreetings[addr];
    }
}
