import java.ArrayList; 
public class User {
    private int walletID; 
    private String email; 
    private ArrayList <Auction> gallery = new Arraylist <Auction>; 

    public void bid (Auction bidAuction, Double amount)
    {
        bidAuction.updateStatus(); 
        if (bidAuction.getLive() == false)
        {
            throw new Exception ("auction has ended"); 
        }
        if (bidAuction.getMinBid() > bid)
        {
            throw new Exception ("insufficient funds"); 
        }
        else
        {
            bidAuction.collectFunds(this); 
        }
    }
    
    public quickBid (Auction bidAuction)
    {
       bid(bidAuction, bidAuction.getMinBid()); 
    }

    


}