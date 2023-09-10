// SPDX-License-Identifier: MIT
pragma solidity 0.8.21;

contract GreetingMultiple {
    uint256 public constant MAX_GREETINGS = 3;
    event GreetingAdded(string message);
    event GreetingDeleted(string message);
    error ContractClosedOrPaused(string message);
    error CallerIsNotTheOwner(string message);
    struct Data {
        string[] greetings;
        uint256 timestamp;
    }
    mapping(address => Data) public allGreetings;
    enum Status {
        Open, // 0
        Closed, // 1
        Paused // 2
    }
    address public owner;
    Status status;

    constructor() {
        owner = msg.sender;
        status = Status.Open;
    }

    modifier checkIfContractIsOpen() {
        // require(status == Status.Open, "Contract is closed or paused");
        if(status != Status.Open) {
            revert ContractClosedOrPaused({ message: "Contract is not open" });
        }
        _;
    }

    modifier checkIfCallerIsOwner() {
        if(owner != msg.sender) {
            revert CallerIsNotTheOwner({ message: "You are not the owner of the contract" });
        }
        _;
    }

    function storeGreeting(string memory _value) external checkIfContractIsOpen {
        Data storage _data = allGreetings[msg.sender];

        require(_data.greetings.length < MAX_GREETINGS, "Max greetings reached!");

        _data.greetings.push(_value);
        _data.timestamp = block.timestamp;

        emit GreetingAdded("Greeting added successfully");
    }

    function retrieveGreetingsByUser(address _addr) external view returns(string[] memory)  {
        return allGreetings[_addr].greetings;
    }

    function retrieveGreetings() external view returns(string[] memory) {
        return allGreetings[msg.sender].greetings;
    }

    function deleteGreeting(uint256 index) external checkIfContractIsOpen returns (bool) {
        delete allGreetings[msg.sender].greetings[index];

        return true;
    }

    function deleteAndOrganizeGreetings(uint256 index) external returns (bool) {
        string[] storage _greetings = allGreetings[msg.sender].greetings;

        _greetings[index] = _greetings[_greetings.length - 1];
        _greetings.pop();

        emit GreetingDeleted("Greeting deleted successfully");

        return true;
    }

    function deleteUser() external returns(string memory) {
        delete allGreetings[msg.sender];

        return "User deleted successfully";
    }

    function deleteUserByAddress(address _addr) external checkIfCallerIsOwner returns(string memory) {
        delete allGreetings[_addr];

        return "User deleted successfully";
    }

    function updateStatus(Status _status) external {
        status = _status;
    }
}
