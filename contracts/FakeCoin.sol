// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/**
 * This is a fungible token contract, intended for development-only
 * interactions. On construction, it grants tokens to the creator.
 */
contract FakeCoin is ERC20 {
    /**
     * On construction, it grants 1000 full tokens to the sender.
     */
    constructor() ERC20("Fake Coin", "FAKE") {
        _mint(msg.sender, 1000000000000000000000);
    }
}