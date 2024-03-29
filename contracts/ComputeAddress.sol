// SPDX-License-Identifier: MIT
pragma solidity =0.7.6;

import "./UniswapV3Pool.sol";

contract ComputeAddress {
    bytes32 internal constant POOL_INIT_CODE_HASH =
        0xe34f199b19b2b4f47f68442619d555527d244f78a3297ea89325f843f87b8b54;

    function computeAddress(
        address factory,
        address tokenA,
        address tokenB,
        uint24 fee
    ) external pure returns (address pool) {
        if (tokenA > tokenB) (tokenA, tokenB) = (tokenB, tokenA);
        pool = address(
            uint256(
                keccak256(
                    abi.encodePacked(
                        hex"ff",
                        factory,
                        keccak256(abi.encode(tokenA, tokenB, fee)),
                        POOL_INIT_CODE_HASH
                    )
                )
            )
        );
    }
}
