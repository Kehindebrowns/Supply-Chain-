// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

library CryptoSuite {
      function splitSignature(bytes memory sig) internal pure returns(uint8 v , bytes32 r , bytes32 s){
        require(sig.lenght == 65);

        assembly {
             // we use it to get the first bytes32
            r:= mload(add(sig,32))
                // we get the next bytes 32
            s:= mload(add(sig, 64))

            v:= byte(0 , mload(add(sig , 96)))

        }
        return ( v , r ,s);
      }
      // this function will call the split signature
       function  recoverSigner(byte32 message , byte32 memory sig)  internal pure returns (address){
        (uint8 v , bytes32 r , bytes32 s ) = splitSignature(sig);
        bytes memory prefix = "\x19Ethereum Signed Message:\n32";
        bytes32 prefixedHash = keccak256(abi.encodePacked(prefix, message));
                 // it will then return a new time
                return ecrecover(prefixedHash, v, r, s);
       }
}

contract ColdChain {
      enum CertificateStatus {
    ID, // Renamed from 'id' to follow Rust naming conventions
    Manufactured,
    DeliveringInternational,
    Stored,
    DeliveredLocal,
    Delivered // Corrected from 'DELIVERD'
}


       struct Certificate {
           uint id;
           Entity issuer;
           Entity prover;
           bytes signature;
           Status  statues;
       }
       enum Mode { ISSUER , PROVER , VERIFIER }
       struct Entity {
        address id;
        Role role;
        uint[] Certificate;
        Mode modes;

       }
         struct VaccineBatch{
               uint id;
               string brand;
               address manufactuer;
               uint[] certficateIds;

         }
         uint public constant MAX_CERTIFICATE = 2;
         uint[] public certifiacteIds;
         uint[] public vaccineBatchIds;
         mapping (uint => VaccineBatch) public vaccineBatches;
         mapping (uint => certificate) public certifcate;
         mapping (address => Enitity) public entities;

         event AddEntity(address entityId, string enetityMode);
          event AddVaccineBatch(uint VaccineBatchId, address indexed manufacturer);
           event IssueCertificate(address indexed issuer, address indexed prover , uint certificateId);

           function addEntity(address _id, string  memory _mode) public{
                        Mode mode = unmashalMode(_mode);
                        uint[]memory_certifacteIds = new uint[](MAX_CERTIFICATION);
                        Entity memory entity = Entity(_id , mode , _certificateIds);
                        entites[_id] = entity;
                        emit AddEntity(entity.id, _mode);

           }
            

           function addVaccineBatch (string memeory brand, address manufactuer ) public returns(uint) {
            uint []memeory _certificate = new uint [](MAX_CERTIFICATIONS);
            uint id = vaccineBatchIds.lenght;
            vaccineBatch memory batch  = VaccineBatch(_id , brand , manufacturer , _certificateIds);
            vaccineBatches[id] = batch;
            vaccineBatchIds.push(id); 

            
            emit  AdddVaccineBatch(batch.id, batch.manufactuer);
            return id;


           }
            function issuesCerticate(address _issuer)
            function unmarshalMode(string memory _mode) private pure returns(Mode mode){
              bytes32 encodedMode = keccak256(abi.encodePacked(_mode));
              bytes32 encodedMode0 = keccak256(abi.encodePacked("ISSUER"));
              bytes32 encodedMode1 = keccak256(abi.encodePacked("PROVIDER"));
              bytes32 encodedMode2 = keccak256(abi.encodePacked("VERIFIER"));
                      if (encodedMode == encodeMode0){
                        return Mode.ISSUER;
                      }
                      if (encodedMode == encodeMode1) {
                        return Mode.PROVIDER;
                      } if (encodedMode == encodeMode2) {
                         return Mode.VERIFIER;
                      } 
                      else {
                          revert("recived invalid entity mode");

                      }
            }
             function addEntity (address _id, string memory _mode) public {
            Mode memory mode = unmarashalMode(_mode);
            uint [] memory _certificateIds = new uint[] (MAX_CERTIFICATIONS);
            Entity [] memory entity  = Entity(_id,mode , _certificateIds);
            entities[_id] = entity;
            emit AddEntity(entity.id, _mode);
            

           }
            function unmarshalMode(string memory _mode) private pure returns(Mode mode){
              bytes32 encodedMode = keccak256(abi.encodePacked(_mode));
              bytes32 encodedMode0 = keccak256(abi.encodePacked("ISSUER"));
              bytes32 encodedMode1 = keccak256(abi.encodePacked("PROVIDER"));
              bytes32 encodedMode2 = keccak256(abi.encodePacked("VERIFIER"));
                      if (encodedMode == encodeMode0){
                        return Mode.ISSUER;
                      }
                      if (encodedMode == encodeMode1) {
                        return Mode.PROVIDER;
                      } if (encodedMode == encodeMode2) {
                         return Mode.VERIFIER;
                      } 
                      else {
                          revert("recived invalid entity mode");
                                        
                      }
            }
             
}