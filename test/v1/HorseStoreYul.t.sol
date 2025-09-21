// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Base_TestV1, IHorseStore} from "./Base_TestV1.t.sol";
import {HorseStoreYul} from "../../src/horseStoreV1/HorseStoreYul.sol";

contract HorseStoreSolc_Test is Base_TestV1 {
    function setUp() public override {
        super.setUp();
        horseStore = IHorseStore(address(new HorseStoreYul()));
    }
}
