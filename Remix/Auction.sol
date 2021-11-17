// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Owner
 * @dev Set & change owner
 */
import "./User.sol"; 
import "@openzeppelin/contracts/token/ERC721/IERC721.sol"; 
contract Auction {
 User public seller; 
 int256 public timeLimit;  
 int256 public startTime;
 uint256 public minBid;
 uint256 public currentBid; 
 uint256 public buyPrice; 
 uint256 public startBid; 
 bool public isLive; 
 uint256 public numBidders; 
 string public details; 
 address payable public addressOfLastBiddingPerson; 
 address payable public auctionWallet; 
 address payable public winner; 
 IERC721 public nft;
 uint public nftId;
 int256 endTime; 

 
 receive() external payable {}

  constructor (string memory description, uint256 buy, uint256 startAuc, User auctioneer, int256 tl) 
  {
      startTime = int(block.timestamp); 
      isLive = true; 
      details = description; 
      minBid = startBid + 1; 
      buyPrice = buy;
      startBid = startAuc;
      seller = auctioneer; 
      auctionWallet = payable (this); 
      timeLimit = tl; 
      endTime = timeLimit-startTime; 
  }
  
    
  modifier hasNotEnded()
  {
      require (isLive = true, "Auction has not ended"); 
      _;
  }

  modifier hasEnded ()
  {
      require (int(block.timestamp) >= (endTime), "This auction is ongoing"); 
      _;
  }
  
   modifier isSeller() {
        // If the first argument of 'require' evaluates to 'false', execution terminates and all
        // changes to the state and to Ether balances are reverted.
        // This used to consume all gas in old EVM versions, but not anymore.
        // It is often a good idea to use 'require' to check if functions are called correctly.
        // As a second argument, you can also provide an explanation about what went wrong.
        require(msg.sender == seller.getAddress(), "Caller is not auctioneer");
        _;
   }
   
   modifier isWinner()
   {
        require(msg.sender == winner, "Caller is not auctioneer");
        _;
   }
   
  
  function updateStatus () public hasEnded()
  {
      isLive = false; 
      winner = addressOfLastBiddingPerson; 
      // payOut();
      win(); 
  }
  
  
  function payOut () public payable hasEnded () 
  {
      winner.transfer(auctionWallet.balance - 1); 
  }
  
  function bid(uint256 bidAmount) public payable hasNotEnded ()
  {
      require (bidAmount > minBid, "Bid too small");
      address payable sender = payable(msg.sender); 
      // sender.transfer(bidAmount); 
      addressOfLastBiddingPerson = sender; 
      minBid = bidAmount + 1; 
      currentBid = bidAmount; 
      numBidders++; 
     if(endTime - (int)(block.timestamp) < 69)
     {
        extendAuction();
     }
  }
  
  function buyOut() public hasNotEnded ()
  {
      bid(buyPrice); 
      endAuction();
  }
  
  function quickBid () public hasNotEnded
  {
      bid(minBid); 
      endAuction();
  }
  
  function GoatBid () public hasNotEnded ()
  {
      bid(69); 
  }
  
  function setNFT (IERC721 _nft, uint _nftId) public
  {
      nft = IERC721(_nft);
      nftId = _nftId;
  }
  
  function getBalance() public view returns (uint) 
  {
        return (auctionWallet.balance);
  }
    function win() public payable isWinner() {
          nft.safeTransferFrom(auctionWallet, addressOfLastBiddingPerson, nftId);
          // seller.getAddress().transfer(msg.value);
  }
  function endAuction () private 
  {
      isLive = false; 
      endTime = int(block.timestamp); 
  }
  function extendAuction () private
  {
      endTime = endTime + 69; 
  }
}
