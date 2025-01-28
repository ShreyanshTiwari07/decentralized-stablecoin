// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.18;

contract DSCEngine{

    error DSCEngine__NeedsMoreThanZero();

    mapping(address token=> address priceFeed) private s_priceFeeds;

    modifier moreThanZero(uint256 amount){
        if(amount==0){
            revert DSCEngine__NeedsMoreThanZero();
        }
        _;
    }

    constructor (address[] memory tokenAddresses, 
             address[] memory priceDeedAddresses,
                address dscAddress ){
         
                }
    function depositCollateralAndMintDsc() external{}

    function depositCollateral(address tokenCollateralAddress, uint256 amountCollateral ) external{}

    function redeemCollateralForDSC() external{}

    function redeemCollateral() external{}

    function mintDSC() external {}

    function burnDSC() external{}

    function liquidate() external{}

    function getHealthFactor() external view {}
}