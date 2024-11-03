// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

// Import OpenZeppelin contracts
import "lib/openzeppelin-contracts/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "lib/openzeppelin-contracts/contracts/access/Ownable.sol";
import "lib/openzeppelin-contracts/contracts/utils/ReentrancyGuard.sol";

// contract Ether10Donate is ERC721URIStorage, Ownable(msg.sender), ReentrancyGuard  {
contract Ether10Donate is Ownable(msg.sender), ReentrancyGuard {
    uint256 public donationAmount;
    uint256 number;
    mapping(string => Doner) public donerList;
    string[] public donerNames;

    // events for simplying dipslaying vars
    event DonationAccepted(uint256 amount, address donerAddress, string name);
    event DisplayVariable(string varValue);

    struct Doner {
        string name;
        uint256 donationAmount; // donation in ETH (in wei)
    }

    /**
     * Takes amount as input and deducts from caller balance and adds to our balance
     * @param _amount - donation amount
     * @param _donerAddress donating party address
     * STEPS: 1. verify balance and address 2. deduct donation amount 3. update state variables
     */
    function AcceptDonations(uint256 _amount, address _donerAddress, string memory _name) public onlyOwner {
        require(address(this).balance > 1 && _amount > 1, "No enough blance to donate.");
        uint256 balance = address(this).balance;
        payable(owner()).transfer(balance);

        donerList[_name] = Doner({name: _name, donationAmount: _amount});
        donerNames.push(_name);
        emit DonationAccepted(_amount, _donerAddress, _name);

    }

    /**
     * Debug Function to display current list of people who donated
     */
    function getDoners() public {
        for (uint256 i = 0; i < donerNames.length; i++) {
            emit DisplayVariable(donerNames[i]);
        }
    }
} // End Contract
