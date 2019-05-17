pragma solidity ^0.5.0;

import './Ownable.sol';

contract DocStamp is Ownable {
  mapping (bytes32 => address) public records;

  bytes32 public name = "rahul";
  bytes32 public detail = "iiit-hyd";

  event CertificateIssued(bytes32 indexed record, uint256 timestamp);

  function issueCertificate(bytes32 name, bytes32 details) external onlyOwner returns (bytes32) {
    bytes32 certificate = keccak256(abi.encodePacked(name, details));    
    require(certificate != keccak256(abi.encodePacked("")));
    records[certificate] = msg.sender;
    emit CertificateIssued(certificate, block.timestamp);
    return certificate;
  }

  function owningAuthority() external view returns (address, address) {   
    return (owner, msg.sender);
  }

  function verifyCertificate(bytes32 name, bytes32 details) external view returns (bool) {
    bytes32 certificate = keccak256(abi.encodePacked(name, details));
    // if certificate are same or not
    // if (certificate == certificate2) {
      // check if exists on blockchain or not
      if (records[certificate] == owner) {
        return true;
      } 
    // }
    return false;
  }
}