import java.ArrayList; 
public class User {
    private int walletID; 
    private String email; 
    private ArrayList <Auction> gallery = new Arraylist <Auction>(); 

    public User (int newWalletID, String newEmail)
    {
        walletId = newWalletId; 
        email = newEmail; 
    }

    public void bid (Auction bidAuction, Double amount)
    {
        bidAuction.updateStatus(); 
        if (bidAuction.getLive() == false)
        {
            throw new Exception ("auction has ended"); 
        }
        if (bidAuction.getMinBid() > bid)
        {
            throw new Exception ("insufficient bid -- must bid a higher amount"); 
        }
        else
        {
            bidAuction.collectFunds(this, amount); 
        }
    }
    
    public quickBid (Auction bidAuction)
    {
       bid(bidAuction, bidAuction.getMinBid()); 
    }


    


}