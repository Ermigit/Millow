// SPDX-License-Identifier: unlicense
pragma solidity ^0.8.17;



contract Play{
     
function _factorial(uint n)public  pure returns (uint ans)
  { 
     ans=1;
 
   if(n == 1 || n == 0)
      ans= 1;
  
else if(n>1){
    
    for(uint i=2; i<=n; i++)
    {
        ans*=i;
    }
}
//return ans;
}

function evenOdd(uint number) public pure returns(string memory s)
{   if(number%2 == 0)
    {
        s="Even";
    }
    else{
     s="Odd";
    }
    return s;
}
   
}