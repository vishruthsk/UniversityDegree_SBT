//SPDX-License-Indentifier: MIT
pragma solidity ^0.8.2;
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";//uri's are link pointing to the  metadata  of token , uri storage is used to stire data on chain 
import "@openzeppelin/contracts/utils/Counters.sol";// nft counter 

contract universitydegree is ERC721URIStorage{
    address owner;// address of the owner who issues degree
    using Counters for Counters.Counter;
    Counters.Counter _tokendIds;
    constructor() ERC721("universitydegree","Degree"){// constructor that takes nft collection name and nft unit as input
        owner = msg.sender; 

    }
     mapping(address => bool) public issuedDegrees;//it records which addresses have degrees issued 
     modifier onlyowner(){
         require(msg.sender==owner); // the person who is making the request is msg.sender that should be equal to owner 
         _;
    }
     function issueDegree(address to) external onlyowner{// function to issue degree (only owner can access it)
         issuedDegrees [to]=true;
         
       

     }
     //tokenuri is the link at which the degree is stored
     function claimDegree(string memory tokenURI) public returns(uint256){//uint256 is the unique tokenid 
         require(issuedDegrees[msg.sender],"degree is not issued");

         _tokendIds.increment();// when ever a degree is minted 
         uint256 newItemId= _tokendIds.current();
         _mint(msg.sender,newItemId);//function to mint new id 
         _setTokenURI(newItemId,tokenURI);
         personToDegree[msg.sender]=tokenURI; 
         issuedDegrees[msg.sender]=false; // so that one address cant mint degree twice 
         return newItemId;
              

        
         


     }
     //this mapping is used for any other person with the address to check the degree
     mapping(address => string) public personToDegree; //here string the link of the degree

      
}