# Parla | contracts

Hi! This repository includes smart contracts in solidity for Ethereum, Avalanche and other blockchains.

*IT IS CREATED FOR LEARNING PURPOSE*

# ERC20

ERC20 is standart for Fungible Tokens, in other words, the token contract has properties and capabilities which makes all tokens same.
 
ERC20.sol contract implementation serves minting, burning features.

In order to create own token contract, the contract should be extended from ERC20.sol and Pausable.sol (if you need!).

> *First parameter indicates the name of the token*
> *Second parameter indicates the symbol of the token*
> *The default decimal is 18*

```
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "./ERC20/ERC20.sol";
import "./lib/Pausable.sol";

/**
 * @title Parla ERC20 Token
 *
 * @dev Implementation of the pausable standard token.
 *
 */
contract ParlaERC20 is ERC20, Pausable {

    constructor() ERC20("Parla", "PAR") { }

    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 amount
    ) internal virtual override {
        super._beforeTokenTransfer(from, to, amount);

        require(!isPaused(), "ParlaERC20: token transfer while paused");
    }

}
```

# Deployment

## Avalanche
The Contract Chain is the default smart contract blockchain on [Avalanche](https://intercom.help/avalabs/en/articles/4058353-what-is-ava) and enables the creation of any Ethereum-compatible smart contracts.

## Truffle
**Truffle** is development framework to makes compile, test and deploy to desired network for blockchains using the Ethereum Virtual Machine (EVM).

In this project, we used Avalanche Fuji Testnet to deploy smart contract.

> truffle-config.js includes network object to configure blockchain networks.

## Getting Started

Create a file named as **.env.json** in root of the project. Set your wallet mnemonic words and snowtrace api key.
```json
{
   "mnemonic": "sample sample sample sample sample sample sample sample sample sample sample sample",
   "snowtrace": "1A4ED7Z39Q921RKZUFRWSETCE8WCH5IX9B"
}
```
*Wallet mnemonic is required for deploying contract to desired network.*
*Snowtrace API key is needed for verifying your contract which makes your contract readable for everyone.*

## Install

Install truffle
```
npm install truffle -g
```

Install project dependencies
```
npm install
```

## Compile
```
truffle compile
```
## Migrate/Deploy
```
truffle migrate --network fuji
```
There are files under migrations folder to make deployment.

**1_initial_migration.js**
```
const ParlaERC20 = artifacts.require("ParlaERC20");

module.exports = async function (deployer) {

  await deployer.deploy(ParlaERC20);
  const parla = await ParlaERC20.deployed();

  console.log("ParlaERC20 deployed to: " + parla.address);

};
```
*Truffle scans .sol files under contracts folder.* 

## Verify
```
truffle run verify ParlaERC20 --network fuji
```