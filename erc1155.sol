// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts@4.8.2/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts@4.8.2/access/Ownable.sol";
import "@openzeppelin/contracts@4.8.2/token/ERC1155/extensions/ERC1155Burnable.sol";

contract MyToken is ERC1155, Ownable, ERC1155Burnable {
    constructor() ERC1155("") {}
    mapping (uint256 => string) private _tokenURIs;

    function setURI(string memory newuri) public onlyOwner {
        _setURI(newuri);
    }

    function uri(uint256 tokenId) override public view 
    returns (string memory) { 
        return(_tokenURIs[tokenId]); 
    } 

    function _setTokenUri(uint256 tokenId, string memory tokenURI)
    private {
         _tokenURIs[tokenId] = tokenURI; 
    } 

    function mint(address account, uint256 id, uint256 amount, bytes memory data)
        public
        onlyOwner
    {
        _mint(account, id, amount, data);
    }

    function mintBatch(address to, uint256[] memory ids, uint256[] memory amounts, bytes memory data)
        public
        onlyOwner
    {
        _mintBatch(to, ids, amounts, data);
    }
}
