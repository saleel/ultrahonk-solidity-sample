pragma solidity ^0.8.17;

import "forge-std/Test.sol";
// import "../contract/Starter.sol";
import "../circuits/target/Verifier.sol";
import "forge-std/console.sol";

contract StarterTest is Test {
    // Starter public starter;
    HonkVerifier public verifier;
    bytes32[] public publicInputs = new bytes32[](0);

    function setUp() public {
        verifier = new HonkVerifier();
        // starter = new Starter(verifier);

        // publicInputs[0] = bytes32(0x0000000000000000000000000000000000000000000000000000000000000003);
    }

    function testVerifyProof() public view {
        bytes memory proof = vm.readFileBinary("./circuits/target/proof-clean");

        console.logBytes(proof);

        verifier.verify(proof, publicInputs);
    }
}
