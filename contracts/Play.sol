// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

/// @title HelloMessage Contract
/// @notice This contract allows the owner to store and update a message on-chain.
/// @dev Inherits `Ownable` from OpenZeppelin to restrict certain functions to the contract owner.
contract HelloMessage is Ownable {
    /// @notice The message stored on-chain.
    string public message = "Hell0";

    /// @dev Emitted when the message is updated.
    /// @param newMessage The updated message.
    event MessageUpdated(string newMessage);

    /// @notice Updates the stored message.
    /// @dev Only callable by the owner of the contract.
    /// @param _msg The new message to store.
    function updateMessage(string memory _msg) public onlyOwner {
        require(bytes(_msg).length > 0, "Message cannot be empty!");
        //require(keccak256(abi.encodePacked(message)) != keccak256(abi.encodePacked(_msg)), "There is nothing changed!");
        require(keccak256(bytes(message)) != keccak256(bytes(_msg)), "There is nothing changed!"); // more optimized as solidity is now supprting string comarition natively

        message = _msg;
        emit MessageUpdated(_msg);
    }

    /// @notice Retrieves the current stored message.
    /// @return The current message stored on-chain.
    function getMessage() public view returns (string memory) {
        return message;
    }
}
