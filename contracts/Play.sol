//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/access/Ownable.sol";

contract HelloMessage is Ownable   {
    string private message = "Hello world";  // message stored on-chain

    event MessageUpdated(string newMessage);

    function updateMessage(string memory _msg)  public onlyOwner  {
        message = _msg;
        emit MessageUpdated(_msg);
    }

    function retrieveMessage() public view returns (string memory) 
    {
        return message;
    }
}
