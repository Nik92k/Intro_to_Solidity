pragma solidity 0.5.1;

contract mycontract {
    mapping(address => uint256) public balances;
    address payable wallet;

    event Purchased(address indexed _buyer, uint256 _amount);

    constructor(address payable _wallet) public {
        wallet = _wallet;
    }

    function() external payable {
        buyToken();
    }

    function buyToken() public payable {
        // buy a token
        balances[msg.sender] += 1;
        // send ether to the wallet
        wallet.transfer(msg.value);
        emit Purchased(msg.sender, 1);
    }
}
