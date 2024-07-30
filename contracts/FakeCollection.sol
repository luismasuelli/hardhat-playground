// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Base64.sol";

/**
 * This is a non-fungible token contract which is related
 * to an owner.
 *
 * Feel free to edit these notes accordingly, but after
 * reading these notes first:
 *
 * Your contract should define a way to mint tokens, and
 * optionally a way to burn tokens.
 */
contract FakeCollection is ERC721 {
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
     * Feel free to setup your ERC721 name and symbol as you please
     * if you change your mind.
     */
    constructor() ERC721("Fake Collection", "FAKE") {
        _safeMint(msg.sender, 1);
        metadata[1] = TokenMetadata({name: "Token One", description: "The 1st token", image: "http://localhost:8081/fake-collection/images/token1.png"});
        _safeMint(msg.sender, 2);
        metadata[2] = TokenMetadata({name: "Token Two", description: "The 2nd token", image: "http://localhost:8081/fake-collection/images/token2.png"});
        _safeMint(msg.sender, 3);
        metadata[3] = TokenMetadata({name: "Token Three", description: "The 3rd token", image: "http://localhost:8081/fake-collection/images/token3.png"});
        _safeMint(msg.sender, 4);
        metadata[4] = TokenMetadata({name: "Token Four", description: "The 4th token", image: "http://localhost:8081/fake-collection/images/token4.png"});
        _safeMint(msg.sender, 5);
        metadata[5] = TokenMetadata({name: "Token Five", description: "The 5th token", image: "http://localhost:8081/fake-collection/images/token5.png"});
    }

    /**
     * Implement your own logic to mint tokens by invoking _safeMint
     * at some point inside one of your methods. The invocation must
     * be like one of these:
     *     _safeMint(account, tokenId)
     *     _safeMint(account, tokenId, "someBinaryData")
     *
     * Also, you can implement your own logic to burn those tokens.
     * The syntax is like: _burn(account, tokenId).
     *
     * Don't allow those operations without prior clear rules.
     */

    /**
     * Retrieves the metadata of the token.
     */
    function _getTokenMetadata(uint256 tokenId) internal view returns (
        string memory name, string memory description, string memory image
    ) {
        _requireOwned(tokenId);
        TokenMetadata storage _metadata = metadata[tokenId];
        name = _metadata.name;
        description = _metadata.description;
        image = _metadata.name;
    }

    /**
     * Retrieves a JSON with the metadata of the token.
     * See https://eips.ethereum.org/EIPS/eip-721 for more details.
     */
    function tokenURI(uint256 tokenId) public override view returns (string memory) {
        (string memory name, string memory description, string memory image) = _getTokenMetadata(tokenId);

        return string(abi.encodePacked("data:application/json;base64,", Base64.encode(abi.encodePacked(
           '{"name": "', name, '", "description": "', description, '", "image": "', image, '"}'
        ))));
    }
}
