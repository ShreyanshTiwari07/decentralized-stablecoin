// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.18;

import {ERC20, ERC20Burnable} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
/*
 * @title DecentralizedStableCoin 
 * Collateral: ETH & BTC
 * Minting: Algorithmic (Decentralized)
 * Relative stability: Pegged to USD
 * 
 * contract: Governed by DSCEngine.
 *           ERC20 implementation of our stablecoin system
 */

contract DecentralizedStablecoin is ERC20Burnable, Ownable {
    error DecentralizedStablecoin__MustBeMoreThanZero();
    error DecentralizedStablecoin__BurnAmountExceedsBalance();
    error DecentralizedStablecoin__NotZeroAddress();

    constructor() ERC20("DecentralizedStablecoin", "DSC") Ownable(msg.sender) {}

    function burn(uint256 _amount) public override onlyOwner {
        uint256 balance = balanceOf(msg.sender);
        if (_amount <= 0) revert DecentralizedStablecoin__MustBeMoreThanZero();
        if (balance < _amount) {
            revert DecentralizedStablecoin__BurnAmountExceedsBalance();
        }
        
        super.burn(_amount);
    }

    function mint(address _to, uint256 _amount) external onlyOwner returns (bool) {
        if (_to == address(0)) {
            revert DecentralizedStablecoin__NotZeroAddress();
        }
        if (_amount <= 0) {
            revert DecentralizedStablecoin__MustBeMoreThanZero();
        }

        _mint(_to, _amount);
        return true;
    }
}
