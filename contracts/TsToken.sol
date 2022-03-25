// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

contract TsToken is ERC721URIStorage {

    using Counters for Counters.Counter;
    Counters.Counter private __tokenId;

    constructor() ERC721 ("SquareNFT", "SQUARE") {
        console.log("TemmyScope NFT contract");
    }

    function outOfNFT() public {
        console.log("Oops!! We are currently out of NFTS to mint");
    }

    //NFT minter
    function mintNFTbyTS() public {
        uint256 newItemId = __tokenId.current();

        //limit mintable NFTs to 15 i.e. 0-14
        if ( newItemId > 14 ){
            outOfNFT();
            return;
        }

        _safeMint(msg.sender, newItemId);

        // Set the NFTs data.
        _setTokenURI(newItemId, "https://jsonkeeper.com/b/SCA4");

        console.log(
            "An NFT w/ ID %s has been minted to %s", newItemId, msg.sender
        );

        // Increment the counter for when the next NFT is minted.
        __tokenId.increment();
    }

}