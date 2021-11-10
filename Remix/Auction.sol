// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Owner
 * @dev Set & change owner
 */
contract Auction {
 User private seller; 
 uint256 private timeLimit;  
 uint256 private startTime;
 uint256 private minBid;
  uint256 private currentBid; 
 uint256 private buyPrice; 
 uint256 private startBid; 
 bool private isLive; 
 address private aucAddress; 
 uint256 private numBidders; 
 String private details; 
 address auctionWallet; 
 
 receive() external payable {}

  constructor (String description, uint256 min, uint256 buy, uint256 startAuc, User auctioneer) 
  {
      startTime = now; 
      isLive = true; 
      details = description; 
      minBid = min;
      buyOut = buy;
      startBid = startAuc;
      seller = auctioneer; 
      auctionWallet = address(this); 
  }
    
  modifier hasEnded ()
  {
      require (now >= (timeLimit - startTime), "This auction is ongoing"); 
      _;
  }
  
   modifier isSeller() {
        // If the first argument of 'require' evaluates to 'false', execution terminates and all
        // changes to the state and to Ether balances are reverted.
        // This used to consume all gas in old EVM versions, but not anymore.
        // It is often a good idea to use 'require' to check if functions are called correctly.
        // As a second argument, you can also provide an explanation about what went wrong.
        require(msg.sender == auctioneer, "Caller is not auctioneer");
        _;
   }
   
  
  function updateStatus () private hasEnded()
  {
      isLive = false; 
  }
  
  function payOut () public payable hasEnded () isSeller()
  {
      auctionWallet.transfer(currentBid); 
  }
  
  function getBalance() public view returns (uint) 
  {
        return auctionWallet.balance;
  }
 
  function sendViaCall(seller.getAddress()) public payable  hasEnded() isSeller() {
        // Call returns a boolean value indicating success or failure.
        // This is the current recommended method to use.
        (bool sent, bytes memory data) = _to.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
    }

}