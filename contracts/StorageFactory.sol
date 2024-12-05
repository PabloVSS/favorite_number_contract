// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory{

    //Criando uma lista para armazenar os dados da simpleStorage
    SimpleStorage[] public listOfsimpleStorageContracts;

    function createSimpleStorageContract() public {
        
    
        SimpleStorage newSimpleStorageContract = new SimpleStorage();
        listOfsimpleStorageContracts.push(newSimpleStorageContract);
    }

    function fsStory(uint256 _simpleStorageIndex, uint256 _newSimpleStorageNumber) public {
        //Address
        //ABI - Application Binary Interface
        listOfsimpleStorageContracts[_simpleStorageIndex].store(_newSimpleStorageNumber);
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256) {
        //Uma viwer para ver o número adicionado na lista, a partir do index
        return listOfsimpleStorageContracts[_simpleStorageIndex].retrieve();
    }



}

