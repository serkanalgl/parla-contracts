//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "./Ownable.sol";

contract Pausable is Ownable{

    modifier notPaused {
        require(!_paused, "This action cannot be performed while the contract is paused");
        _;
    }

    event PauseChanged(bool isPaused);

    bool private _paused;

    /**
     * @dev Initializes the contract in unpaused state.
     */
    constructor() {
        _paused = false;
    }

    /**
     * @dev Returns true if the contract is paused, and false otherwise.
     */
    function isPaused() public view virtual returns (bool) {
        return _paused;
    }

    /**
     * @dev Contract is paused
     */
    function pause() external virtual onlyOwner{
        require(_paused, "This contract is already paused");
        _paused = true;
        emit PauseChanged(_paused);
    }

    /**
     * @dev Contract is unpaused
     */
    function unpause() external virtual onlyOwner{
        require(!_paused, "This contract is a already unpaused");
        _paused = false;
        emit PauseChanged(_paused);
    }



}