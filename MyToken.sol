// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyToken {
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public totalSupply;
    mapping(address => uint256) public balanceOf;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Mint(address indexed to, uint256 value);

    address public owner;

    constructor(string memory _name, string memory _symbol, uint8 _decimals, uint256 _initialSupply) {
        name = _name;
        symbol = _symbol;
        decimals = _decimals;
        totalSupply = _initialSupply * 10 ** uint256(_decimals);
        balanceOf[msg.sender] = totalSupply;
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    function transfer(address _to, uint256 _value) external returns (bool) {
        require(_to != address(0), "Invalid address");
        assert(balanceOf[msg.sender] >= _value); // Invariant: sender must have sufficient balance
        
        uint256 newBalanceReceiver = balanceOf[_to] + _value;
        assert(newBalanceReceiver >= balanceOf[_to]); // Ensure no overflow
        
        if (newBalanceReceiver < balanceOf[_to]) {
            revert("Overflow detected"); // Explicit revert in case of overflow
        }
        
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] = newBalanceReceiver;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function mint(address _to, uint256 _value) external onlyOwner {
        require(_to != address(0), "Invalid address");

        // Ensure no overflow when minting
        uint256 newTotalSupply = totalSupply + _value;
        assert(newTotalSupply >= totalSupply);

        totalSupply = newTotalSupply;
        balanceOf[_to] += _value;
        emit Mint(_to, _value);
    }
}
