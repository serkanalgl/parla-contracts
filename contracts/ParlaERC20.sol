// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "./ERC20/ERC20.sol";
import "./lib/Pausable.sol";

/**
 * @title Parla ERC20 Token
 *
 * @dev Implementation of the basic standard token.
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
