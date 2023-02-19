// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import {OpenZeppelinEnumerableSet} from "../src/OpenZeppelinEnumerableSet.sol";
import {OpenZeppelinBitMaps} from "../src/OpenZeppelinBitMaps.sol";

contract SetTest is Test {
    OpenZeppelinEnumerableSet private openZeppelinEnumerableSet;
    OpenZeppelinBitMaps private openZeppelinBitMaps;

    function setUp() public {
        openZeppelinEnumerableSet = new OpenZeppelinEnumerableSet();
        openZeppelinBitMaps = new OpenZeppelinBitMaps();
    }

    function testSet() public {
        uint256[] memory values = new uint256[](7);
        values[0] = 1;
        values[1] = 1;
        values[2] = 2;
        values[3] = 3;
        values[4] = 5;
        values[5] = 8;
        values[6] = 13;
        uint256[] memory valuesSet = new uint256[](6);
        valuesSet[0] = 1;
        valuesSet[1] = 2;
        valuesSet[2] = 3;
        valuesSet[3] = 5;
        valuesSet[4] = 8;
        valuesSet[5] = 13;

        for (uint256 i = 0; i < values.length; ++i) {
            openZeppelinEnumerableSet.add(values[i]);
            openZeppelinBitMaps.add(values[i]);
        }

        for (uint256 i = 0; i < values.length; ++i) {
            assertTrue(openZeppelinEnumerableSet.contains(values[i]));
            assertTrue(openZeppelinBitMaps.contains(values[i]));
        }

        for (uint256 i = 0; i < valuesSet.length; ++i) {
            assertEq(openZeppelinEnumerableSet.at(i), valuesSet[i]);
            assertEq(openZeppelinBitMaps.at(i), valuesSet[i]);
        }

        assertEq(openZeppelinEnumerableSet.cardinality(), valuesSet.length);
        assertEq(openZeppelinBitMaps.cardinality(), valuesSet.length);

        for (uint256 i = 0; i < values.length; ++i) {
            openZeppelinEnumerableSet.remove(values[i]);
            openZeppelinBitMaps.remove(values[i]);
        }

        for (uint256 i = 0; i < values.length; ++i) {
            assertFalse(openZeppelinEnumerableSet.contains(values[i]));
            assertFalse(openZeppelinBitMaps.contains(values[i]));
        }

        assertEq(openZeppelinEnumerableSet.cardinality(), 0);
        assertEq(openZeppelinBitMaps.cardinality(), 0);
    }
}
