import java.util.*;  
public class Seller {
   
    public ArrayList <Auction> aucList = new ArrayList <Auction> (); 
    int walletID; 

    public Seller (int newWalletID)
    {
       walletID = newWalletId;  
    }

    public void createAuction (Double newMinBid, Double newBuyPrice, int newtimeLimit, int currentBlockNumber)
    {
       aucList.add(new Auction (newMinBid, newBuyPrice, newTimeLimit, currentBlockNumber, this)); 
    }


    
}