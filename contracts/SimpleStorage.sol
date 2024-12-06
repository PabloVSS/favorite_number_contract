// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24; // solidity versions

contract SimpleStorage{

    // Basic Type: boolean = true or false, uint = int positive, int = int positive or negative, adress = adress, byte

    //favoreiteNumber gets initialized to 0 if no value is given
    
    uint256 public myfavoriteNumber;

    
    struct Person {
        uint256 favoriteNumber;
        string name;
    }    

    //Dinamic array
    Person [] public listOfPeople;

    mapping(string => uint256) public nameToFavoriteNumber;

    function store(uint256 _favoriteNumber) public virtual{
        myfavoriteNumber = _favoriteNumber;
    }

    //view: return some value

    function retrieve() public view returns(uint256) {
        return myfavoriteNumber;
     }
     
     //calldata, memory, storage
     function addPerson(string memory _name, uint256 _favoriteNumber) public {
        listOfPeople.push(Person(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
     }
}


