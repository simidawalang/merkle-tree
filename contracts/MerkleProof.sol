// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract MerkleProof {
    function verify(bytes32[] memory proof, bytes32 root, bytes32 leaf, uint index) public pure returns (bool) {
        // proof: an array of hashes that are needed to compute the merkle root.
        // root: the merkle root itself.
        // leaf: the hash if the element in the array that was used to construct the merkle tree.
        // index: the index of the leaf.

        // This function will return true if it can recreate the merkle root from the proof, leaf, and index
        // and false otherwise.
        bytes32 hash = leaf;

        for(uint i = 0; i < proof.length; i++) {
            if(index % 2 == 0) {
                hash = keccak256(abi.encodePacked(hash, proof[i]));
            } else {
                hash = keccak256(abi.encodePacked(proof[i], hash));
            } 
            
            index = index / 2;
        }

        return hash == root;
    }

}