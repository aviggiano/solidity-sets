// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

interface ISet {
    function add(uint256 value) external;

    function remove(uint256 value) external;

    function contains(uint256 value) external view returns (bool);

    function cardinality() external view returns (uint256);

    function at(uint256 index) external view returns (uint256);

    function values() external view returns (uint256[] memory);
}
