// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.18;

import {ERC20,ERC20Burnable} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
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
contract DecentralizedStablecoin is ERC20Burnable, Ownable{

constructor()ERC20("DecentralizedStablecoin","DSC"){

}
}