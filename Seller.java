import java.util.*;  
public class Seller {
    private ArrayList <Auction> aucList = new ArrayList <Auction> (); 

    public void createAuction (double minBid, double buyPrice)
    {
       aucList.add(new Auction (minBid, buyPrice)); 
    }
}