// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {ISet} from "./ISet.sol";
import {BitMaps} from "@openzeppelin/contracts/utils/structs/BitMaps.sol";

contract OpenZeppelinBitMaps is ISet {
    using BitMaps for BitMaps.BitMap;

    BitMaps.BitMap private set;
    uint256 private length;

    constructor() {}

    function add(uint256 value) external {
        if (!set.get(value)) {
            ++length;
        }
        set.set(value);
    }

    function remove(uint256 value) external {
        if (set.get(value)) {
            --length;
        }
        set.unset(value);
    }

    function contains(uint256 value) external view returns (bool) {
        return set.get(value);
    }

    function cardinality() external view returns (uint256) {
        return length;
    }

    function at(uint256 index) external view returns (uint256) {
        uint256 found = 0;
        uint256 value = 0;
        for (; found < index + 1; ++value) {
            if (set.get(value)) {
                ++found;
            }
        }
        return value - 1;
    }

    function values() external view returns (uint256[] memory) {
        uint256[] memory ans = new uint256[](length);
        uint256 found = 0;
        uint256 value = 0;
        for (; found < length; ++value) {
            if (set.get(value)) {
                ans[found] = value;
                ++found;
            }
        }
        return ans;
    }
}
