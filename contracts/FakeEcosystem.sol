// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/utils/Base64.sol";

/**
 * This is a mixed token contract which mints 5 tokens to
 * the creator of this contract, in an amount of 10^21 units
 * (there's no abstraction of the amounts scale) for each
 * token type. The URLs map to localhost (port 8081), which
 * can (and should) be deployed in this project.
 */
contract FakeEcosystem is ERC1155 {
    /**
     * The token metadata record.
     */
    struct TokenMetadata {
        /**
         * The token name.
         */
        string name;

        /**
         * The token description.
         */
        string description;

        /**
         * The token image.
         */
        string image;
    }

    // The per-token metadata.
    mapping(uint256 => TokenMetadata) private metadata;

    /**
     * The URL is not needed here: we'll generate proper data
     * URIs for each token.
     */
    constructor() ERC1155("about:blank") {
        metadata[1] = TokenMetadata({name: "Token One", description: "The 1st token", image: "http://localhost:8081/fake-ecosystem/images/token1.png"});
        metadata[2] = TokenMetadata({name: "Token Two", description: "The 2nd token", image: "http://localhost:8081/fake-ecosystem/images/token2.png"});
        metadata[3] = TokenMetadata({name: "Token Three", description: "The 3rd token", image: "http://localhost:8081/fake-ecosystem/images/token3.png"});
        metadata[4] = TokenMetadata({name: "Token Four", description: "The 4th token", image: "http://localhost:8081/fake-ecosystem/images/token4.png"});
        metadata[5] = TokenMetadata({name: "Token Five", description: "The 5th token", image: "http://localhost:8081/fake-ecosystem/images/token5.png"});
        _mint(msg.sender, 1, 1000000000000000000000, "");
        _mint(msg.sender, 2, 1000000000000000000000, "");
        _mint(msg.sender, 3, 1000000000000000000000, "");
        _mint(msg.sender, 4, 1000000000000000000000, "");
        _mint(msg.sender, 5, 1000000000000000000000, "");
    }

    /**
     * Retrieves the metadata of the token.
     */
    function _getTokenMetadata(uint256 id) internal view returns (
        string memory name, string memory description, string memory image
    ) {
        TokenMetadata storage _metadata = metadata[id];
        name = _metadata.name;
        description = _metadata.description;
        image = _metadata.name;
    }

    /**
     * Retrieves a JSON with the metadata of the token.
     * See https://eips.ethereum.org/EIPS/eip-1155 for more details.
     */
    function uri(uint256 id) public view override returns (string memory) {
        (string memory name, string memory description, string memory image) = _getTokenMetadata(id);

        // Feel free to add more things to the "properties" sub-dictionary.
        return string(abi.encodePacked("data:application/json;base64,", Base64.encode(abi.encodePacked(
            '{"name": "', name, '", "description": "', description, '", "image": "', image,
            '", "properties": {}}'
        ))));
    }
}
