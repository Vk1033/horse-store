object "HorseStoreYul" {
    code {
        datacopy(0, dataoffset("runtime"), datasize("runtime"))
        return(0, datasize("runtime"))
    }
    object "runtime" {
        code {
            switch selector()
            case 0xCDFEAD2E {
                storeNumber(decodeAsUint(0))
            }
            case 0xE026C017 {
                returnUint(readNumber())
            }

            default { revert(0, 0) }

            function storeNumber(num) {
                sstore(0, num)
            }

            function readNumber() -> num {
                num := sload(0)
            }
            
            function selector() -> s {
                s:= div(calldataload(0), exp(2, 224))
            }

            function decodeAsUint(offset) -> v {
                let positionInCalldata := add(4,mul(offset,0x20))
                if lt(calldatasize(), add(positionInCalldata, 0x20)) {
                    revert(0,0)
                }
                v := calldataload(positionInCalldata)
            }

            function returnUint(v) {
                mstore(0, v)
                return(0, 0x20)
            }
        }
    }
}
    