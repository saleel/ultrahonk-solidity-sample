import { UltraHonkBackend, splitHonkProof } from "@aztec/bb.js";
import fs from "fs";
import circuit from "../circuits/target/noir_solidity.json";


(async () => {
  const proofW = fs.readFileSync("../circuits/target/proof");

  const { proof, publicInputs } = splitHonkProof(new Uint8Array(proofW));
  console.log("proof:", proof);
  console.log("publicInputs:", publicInputs);

  const honk = new UltraHonkBackend(circuit.bytecode);

  const verified = await honk.verifyProof({ proof, publicInputs: deflattenFields(publicInputs) });

  console.log("verified:", verified);

  fs.writeFileSync("../circuits/target/proof-clean", "0x" + proofW.toString("hex"));
  console.log("Proof written to ../circuits/target/proof-clean");
})();






// taken from @aztec/bb.js/proof
function uint8ArrayToHex(buffer: Uint8Array): string {
  const hex: string[] = [];

  buffer.forEach(function (i) {
    let h = i.toString(16);
    if (h.length % 2) {
      h = '0' + h;
    }
    hex.push(h);
  });

  return '0x' + hex.join('');
}

export function deflattenFields(flattenedFields: Uint8Array): string[] {
  const publicInputSize = 32;
  const chunkedFlattenedPublicInputs: Uint8Array[] = [];

  for (let i = 0; i < flattenedFields.length; i += publicInputSize) {
    const publicInput = flattenedFields.slice(i, i + publicInputSize);
    chunkedFlattenedPublicInputs.push(publicInput);
  }

  return chunkedFlattenedPublicInputs.map(uint8ArrayToHex);
}

