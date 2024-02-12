#  Token Contract

## Overview
This Solidity contract implements a basic ERC20 token. ERC20 is a standard interface for fungible tokens on the Ethereum blockchain. The contract allows for the creation of a token with a specified name, symbol, decimal places, and initial supply. Users can transfer tokens between addresses.

## Contract Details

### Contract Name
MyToken

### Functions
1. **Constructor**: Initializes the token with the specified name, symbol, decimal places, and initial supply. The token supply is credited to the contract deployer's address.
   
2. **transfer**: Allows users to transfer tokens from their address to another address. It checks for the validity of the recipient address, ensures the sender has sufficient balance, and protects against integer overflow. If the transfer is successful, it emits a Transfer event.

### State Variables
- `name`: The name of the token.
- `symbol`: The symbol of the token.
- `decimals`: The number of decimal places the token supports.
- `totalSupply`: The total supply of the token.
- `balanceOf`: A mapping of addresses to their token balances.

## Usage
1. **Deploying the Contract**: Deploy the contract to the Ethereum blockchain with the desired parameters (name, symbol, decimals, initial supply).

2. **Interacting with the Contract**: Use the `transfer` function to transfer tokens between addresses.

## Security Considerations
- Ensure that the recipient address is valid (`_to != address(0)`).
- Protect against integer overflow when performing arithmetic operations.
- Use appropriate access controls to restrict access to sensitive functions.

## Author 
- Vinod

