/// Basic function calling in solidity
pragma solidity ^0.5.1;

contract mycontract {
    uint256 public peopleCount = 0;
    mapping(uint256 => Person) public people;

    address owner;

    uint256 openingTime = 1624447450;

    modifier onlyWhileOpen() {
        require(block.timestamp >= openingTime);
        _;
    }

    struct Person {
        uint256 _id;
        string _firstname;
        string _lastname;
    }

    function addPerson(string memory _firstname, string memory _lastname)
        public
        onlyWhileOpen
    {
        incrementCount();
        people[peopleCount] = Person(peopleCount, _firstname, _lastname);
    }

    function incrementCount() internal {
        peopleCount += 1;
    }
}
