// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Owner
 * @dev Set & change owner
 */
 contract User {
   
   address payable private wallet; 
   
   constructor  (address payable walletID) payable{
    wallet = walletID; 
   }
    
    function getAddress () public view returns(address payable)
    {
        return wallet; 
    }
}
