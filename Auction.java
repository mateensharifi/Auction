import java.util.ArrayList;
public class Auction {
    public static int nextID; 
    private String ID; 
    public static int blockTime; // time to mine a block
    private Double minBid; 
    private Double buyPrice; 
    private int timeLimit; 
    private int blockNumber; // blockNumber when initialized 
    public static int currentBlock;  // current blockID -- updating
    private ArrayList <Users> bidderList = new ArrayList <Users> (); 
    private boolean isLive; 
    private String auctionWallet; 
    String description; 
    private Seller sell; 
    
    public Auction (Double newMinBid, Double newBuyPrice, int newtimeLimit, int currentBlockNumber, Seller newSell)
    {
       blockTime = .1; // implement later -- blockTime gets current time to mine a block
        ID = "" + nextID; 
       nextID++;
       Seller = newSell; 
       minBid = newMinBid; 
       buyPrice = newBuyPrice; 
       blockNumber = currentBlocKNumber; 
       timeLimit = (newTimeLimit)/(blockTime); 
       

    }

    public void updateUser ()
    {
        // send an email implement this later
    }
    public void updateItemStatus ()
    {
        if  (currentBlock > timeLimit + blockNumber) // implement current block on blockchain as current block
       {
          isLive = false; 
          for (int i = 0; i < 2000000; i++)
          {
              bidderList.get(i);
               // send i back to users in ArrayList over blockchain
          }
       }
    }
    public boolean getLive () 
        {
            return isLive; 
        }
    public Double getMinBid()
    {
        return midBid; 
    }
    public void collectFunds (User bidder, double amount)
    {
        bidderList.addAtIndex((int)amount, bidder); 
        // method that transfers funds from the bidder's wallet to the auctionWallet

    }
    
}