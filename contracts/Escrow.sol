//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

interface IERC721 {  //### why we use this interface here
    function transferFrom(
        address _from,
        address _to,
        uint256 _id
    ) external;
}
contract Escrow {
    address public nftAddress;
    address payable public seller;
    address public inspector;
    address public lender;

    modifier onlySeller() {
        require(msg.sender == seller, "Only seller can call this function");
      _;
      }
    modifier onlyBuyer(uint256 _nftID) {
        require(msg.sender == buyer[_nftID], "Only buyer can call this function");
      _;
      }
    modifier onlyInspector(){
        require(msg.sender == inspector, "Only inspector can call this function");
      _;
      }
     
    mapping (uint256 => bool) public isListed; 
    mapping (uint256 => uint256) public purchasePrice; 
    mapping (uint256 => uint256 ) public escrowAmount; 
    mapping (uint256 => address ) public buyer;  
    mapping (uint256 => bool ) public inspectionPassed; 
    mapping (uint256 => mapping (address => bool)) public approval;

     constructor(
        address _nftAddress,
        address payable _seller,
        address _inspector,
        address _lender)
    {
        nftAddress = _nftAddress;
        seller = _seller;
        inspector = _inspector;
        lender = _lender;
    }


    function list(uint256 _nftID, address _buyer, uint _purchasePrice, uint _escrowAmount)  public onlySeller{
        IERC721(nftAddress).transferFrom(msg.sender, address(this), _nftID);
        isListed[_nftID]= true;
        purchasePrice[_nftID]=  _purchasePrice;
        escrowAmount[_nftID]=_escrowAmount;
        buyer[_nftID]= _buyer;


    }
    
    function depositEarnest(uint256 _nftID) public payable onlyBuyer(_nftID){
        require(msg.value >= escrowAmount[_nftID], "Insufficient funds");
      
    }
    
     receive() external payable {} //The receive() function is useful for accepting direct Ether transfers to a contract when no other function is explicitly invoked

     function getBalance() public view returns(uint)
     {
        return address(this).balance;
     }


     function approveSale(uint256 _nftID) public 
     {
        approval[_nftID][msg.sender] = true;
     }

     function updateInspectionStatus(uint256 _nftID, bool _passed) public onlyInspector
     {
        inspectionPassed[_nftID]= _passed;
     }

     function  finalizeSale(uint256 _nftID) public 
     {
         require(inspectionPassed[_nftID], "Inspection is not passed");
         require(approval[_nftID][buyer[_nftID]]);
         require(approval[_nftID][seller]);
         require(approval[_nftID][lender]);
         require(address(this).balance >= purchasePrice[_nftID], "Insufficient funds, fund didn't arrive");
         
         isListed[_nftID]= false;
         (bool success,)= payable(seller).call{value: address(this).balance}("");
         require(success);
         IERC721(nftAddress).transferFrom(address(this), buyer[_nftID], _nftID);


     }


     function cancleSale(uint256 _nftID) public onlySeller
     {
      if(inspectionPassed[_nftID] == false)
      {
        payable(buyer[_nftID]).transfer(address(this).balance);
      } else
      {
        payable(seller).transfer(address(this).balance);
      }
     }





}
