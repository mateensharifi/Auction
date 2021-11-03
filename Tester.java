import java.util.*; 
public class Tester {
    public static void Main (String [] args)
    {
    
    // auction functions well
     Seller john = new Seller("12414124"); 
    john.createAuction(5, 1, 10, 1); 
    User dave = new User (124141414, "dave@urmom.com"); 
    dave.quickBid(john.aucList.get(0)); 
    john.aucList.get(0).endAuction (); 
     
    //bids under or equal to min bid
    john.createAuction(5, 5, 10, 1); 
    dave.bid(john.aucList.get(1), 0); 
    john.aucList.get(1).endAuction (); 

    // bids on auction that is over; 
    john.createAuction(5, 5, 10, 1); 
    john.aucList.get(2).endAuction (); 
    dave.bid(john.aucList.get(2), 0); 

    }

    }

}