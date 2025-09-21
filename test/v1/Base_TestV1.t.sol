// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import {Test, console2} from "forge-std/Test.sol";
import {IHorseStore} from "../../src/horseStoreV1/IHorseStore.sol";
import {HorseStore} from "../../src/horseStoreV1/HorseStore.sol";

abstract contract Base_TestV1 is Test {
    IHorseStore public horseStore;

    function setUp() public virtual {
        horseStore = IHorseStore(address(new HorseStore()));
    }

    function testReadValue() public view {
        uint256 numberOfHorses = horseStore.readNumberOfHorses();
        console2.log("Number of horses:", numberOfHorses);
        assertEq(numberOfHorses, 0);
    }

    function testWriteValue(uint256 newHorseCount) public {
        horseStore.updateHorseNumber(newHorseCount);
        uint256 numberOfHorses = horseStore.readNumberOfHorses();
        console2.log("Number of horses after update:", numberOfHorses);
        assertEq(numberOfHorses, newHorseCount);
    }
}
