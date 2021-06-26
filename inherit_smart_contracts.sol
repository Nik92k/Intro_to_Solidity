pragma solidity 0.5.1;

contract ERC20token {
    string public name;
    mapping(address => uint256) public balances;

    constructor(string memory _name) public {
        name = _name;
    }

    function mint() public {
        balances[tx.origin]++;
    }
}

contract myToken is ERC20token {
    string public symbol;
    address[] public owners;
    uint256 ownerCount;

    constructor(string memory _name, string memory _symbol)
        public
        ERC20token(_name)
    {
        symbol = _symbol;
    }

    function mint() public {
        super.mint();
        ownerCount++;
        owners.push(msg.sender);
    }
}
