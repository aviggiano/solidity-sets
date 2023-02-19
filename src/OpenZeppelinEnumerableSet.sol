// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {ISet} from "./ISet.sol";
import {EnumerableSet} from "@openzeppelin/contracts/utils/structs/EnumerableSet.sol";

contract OpenZeppelinEnumerableSet is ISet {
    using EnumerableSet for EnumerableSet.UintSet;
    EnumerableSet.UintSet private set;

    constructor() {}

    function add(uint256 value) external {
        set.add(value);
    }

    function remove(uint256 value) external {
        set.remove(value);
    }

    function contains(uint256 value) external view returns (bool) {
        return set.contains(value);
    }

    function cardinality() external view returns (uint256) {
        return set.length();
    }

    function at(uint256 index) external view returns (uint256) {
        return set.at(index);
    }

    function values() external view returns (uint256[] memory) {
        return set.values();
    }
}
