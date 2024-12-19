// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

/// @title HelloMessage Contract
/// @notice This contract allows the owner to store and update a message on-chain.
/// @dev Inherits `Ownable` from OpenZeppelin to restrict certain functions to the contract owner.
contract HelloMessage is Ownable {
    /// @notice The message stored on-chain.
    string private message = "Hell0";

    /// @dev Emitted when the message is updated.
    /// @param oldMessage The old message before the update.
    /// @param newMessage The updated message.
    event MessageChanged(string oldMessage, string newMessage);

    error MessageEmpty();
    error MessageNotChanged();

    /// @notice Updates the stored message.
    /// @dev Only callable by the owner of the contract.
    /// @param _msg The new message to store.
    function updateMessage(string memory _msg) public onlyOwner {
        if (bytes(_msg).length == 0) revert MessageEmpty();
        if (keccak256(bytes(message)) == keccak256(bytes(_msg))) revert MessageNotChanged();
    

        string memory oldMessage = message;
        message = _msg;
        emit MessageChanged(oldMessage, _msg);
    }

    /// @notice Retrieves the current stored message.
    /// @return The current message stored on-chain.
    function getMessage() public view returns (string memory) {
        return message;
    }
}
