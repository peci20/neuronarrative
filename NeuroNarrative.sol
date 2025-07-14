// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {ERC20Permit} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";
import {ERC20Pausable} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Pausable.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract NeuroNarrative is ERC20, ERC20Permit, ERC20Pausable, Ownable {
    uint256 public immutable maxSupply;

    constructor() 
        ERC20("NeuroNarrative", "NNA")
        ERC20Permit("NeuroNarrative")
        Ownable(msg.sender)
    {
        maxSupply = 20_000_000_000 * 10 ** decimals();
        _mint(msg.sender, maxSupply);
    }

    function pause() external onlyOwner {
        _pause();
    }

    function unpause() external onlyOwner {
        _unpause();
    }

    function _update(address from, address to, uint256 amount)
        internal
        override(ERC20, ERC20Pausable)
    {
        super._update(from, to, amount);
    }
}
