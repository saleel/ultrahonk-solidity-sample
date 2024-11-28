pragma solidity ^0.8.17;

import "../circuits/target/Verifier.sol";

contract Starter {
    HonkVerifier public verifier;

    constructor(HonkVerifier _verifier) {
        verifier = _verifier;
    }

    function verifyEqual(bytes calldata proof, bytes32[] calldata y) public view returns (bool) {
        bool proofResult = verifier.verify(proof, y);
        require(proofResult, "Proof is not valid");
        return proofResult;
    }
}
