# 📝 Contracts Favorite Number

Este é o meu primeiro projeto utilizando **Solidity**, realizado atráves do curso  onde desenvolvi **três contratos inteligentes** com funcionalidades para armazenar, gerenciar, listar e mapear o nome e o número favorito de uma pessoa. O projeto também explora conceitos como extensão e modificação de contratos existentes.  
O objetivo principal é compreender os fundamentos básicos da criação e implementação de contratos inteligentes na blockchain.

---
En
---

This is my first project using **Solidity**, where I developed **three smart contracts** with functionalities to store, manage, list and map a person's name and favorite number. The project also explores concepts such as extending and modifying existing contracts.
The main goal is to understand the basics of creating and implementing smart contracts on the blockchain.

---
Pt-br
---

## 🎯 Objetivo

- Aprender o básico sobre a construção de contratos inteligentes.
- Praticar conceitos como armazenamento de dados, estruturas de contrato e boas práticas de desenvolvimento em **Solidity**.

---
En
---
## 🎯 Objective

- Learn the basics of building smart contracts.
- Practice concepts such as data storage, contract structures and good development practices in **Solidity**.
  
---
Pt-br
---

## 🛠️ Contratos

### 1️⃣ **SimpleStorage**
Este contrato permite adicionar o nome de uma pessoa e o número favorito dela. Ele armazena e gerencia os números favoritos, além de listar e mapear os dados por nome.

### 2️⃣ **StorageFactory**
Gerencia múltiplas instâncias de contratos **SimpleStorage**, permitindo criar e interagir com eles.

### 3️⃣ **AddFiveStorage**
Extende a funcionalidade do **SimpleStorage**, adicionando um valor fixo (+5) ao número favorito.

---
En
---

## 🛠️ Contracts

### 1️⃣ **SimpleStorage**
This contract allows you to add a person's name and their favorite number. It stores and manages favorite numbers, as well as listing and mapping data by name.

### 2️⃣ **StorageFactory**
Manages multiple instances of **SimpleStorage** contracts, allowing you to create and interact with them.

### 3️⃣ **AddFiveStorage**
Extends the functionality of **SimpleStorage**, adding a fixed value (+5) to the favorite number.

---
Pt-br
---
## 💻 Explicando os Códigos

### 1️⃣ **SimpleStorage**

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract SimpleStorage {
    uint256 public myfavoriteNumber;

    struct Person {
        uint256 favoriteNumber;
        string name;
    }

    Person[] public listOfPeople;
    mapping(string => uint256) public nameToFavoriteNumber;

    function store(uint256 _favoriteNumber) public {
        myfavoriteNumber = _favoriteNumber;
    }

    function retrieve() public view returns (uint256) {
        return myfavoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        listOfPeople.push(Person(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}
```

### Licença e Versão do código em Solidity:

- * //SPDX-License-Identifier: MIT * : Especifica a licença do código como MIT.
- * pragma solidity ^0.8.24; *: Define a versão do compilador Solidity, com suporte de versão mais recentes e compatíveis, ao utilizar o simbolo "^".

### Declaração do contrato

- *contract SimpleStorage { ... }*:  Declaro que esse contrato chama SimpleStorage;

###Variável do projeto:

- *uint256 public myfavoriteNumber*: Declara uma variável público ("public") que armazena um número inteiro ("uint") de 256 bits ("256"); 

### Declarando uma estrutura (Struct):

- *struct Person {...}*: Define a estrutura ("Struct") "Person" co duas propriedades;
- *uint256 favoriteNumber* A estutura terá uma variável chamada "favoriteNumber" que será um inteiro("uint") de 256 bits("256").
- *string name* A estutura terá uma variável chamada "Name" que será um string("string").

### Array Dinamico e mapeamento

- *Person[] public listOfPeople* Cria um Array dinâmico chamado "listOfPeople", que é publico ("public") que armazena objetos do tipo "Person[]" ;
- *mapping(string => uint256) public nameToFavoriteNumber*: Declara um mapeamento público associando um nome (string) em um número favorito(uint256)

Funções:

- *function store(uint256 _favoriteNumber) public {...}* : Armazenda o número favorito em "myFavoriteNumber".
- *function retrieve() public view returns (uint256) {...}* : Função pública para retornar o número favorito  (myfavoriteNumber), para isso utiliza o view para identificar que tem apenas a função de leitura;
- *function addPerson(string memory _name, uint256 _favoriteNumber) public {...}*:  Adicionar uma nova pessoa ao array "listOfPeople" e atualiza  o mapeamento nameToFavoriteNumber, com os dados fornecidos.
 

### 2️⃣ **StorageFactory**

```solidity
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
```

### Licença e Versão do código em Solidity:

- * //SPDX-License-Identifier: MIT * : Especifica a licença do código como MIT.
- * pragma solidity ^0.8.24; *:  Define a versão do compilador Solidity, com suporte de versão mais recentes e compatíveis, ao utilizar o simbolo "^".

### Importação dos Contratos:

- *import {SimpleStorage} from "./SimpleStorage.sol";*: Realiza a importação do "contract" SimpleStorage para reutilizar.

### Declaração do contrato

- *contract StorageFactory{...}*: Declara qual é o nome desse contrato StorageFactory.

### Declarar Variavel

- *SimpleStorage[] public listOfsimpleStorageContracts*: Um array dinâmico que armazena instâncias de SimpleStorage.

### Funções

- *function createSimpleStorageContract() public {...}*: Cria uma nova instância do contract SimpleStorage e adiciona ao array listOfsimpleStorageContracts.
- *function fsStory(uint256 _simpleStorageIndex, uint256 _newSimpleStorageNumber) public {...}*: Atualiza o número favorito em uma instância específica de SimpleStorage, atraves do indice fornecido.
- *function sfGet(uint256 _simpleStorageIndex) public view returns(uint256) {...}*: Uma viwer que tem apenas a função de vizualizar o valor armazendo de uma instância especificada através do indice fornecido.


### 3️⃣ **AddFiveStorage**

```solidity

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24; // solidity versions

import {SimpleStorage} from "./SimpleStorage.sol";


contract AddFiveStorage is SimpleStorage{
    //+5
    //override
    function store(uint256 _newNumber) public override {
        myfavoriteNumber = _newNumber + 5;
    }
}
```

## Licença e Versão do código em Solidity:

- * //SPDX-License-Identifier: MIT * : Especifica a licença do código como MIT.
- * pragma solidity ^0.8.24; *:  Define a versão do compilador Solidity, com suporte de versão mais recentes e compatíveis, ao utilizar o simbolo "^".

### Importação dos Contratos:

- *import {SimpleStorage} from "./SimpleStorage.sol";*: Realiza a importação das informações existentes no "contract" SimpleStorage.

### Função:

- *contract AddFiveStorage is SimpleStorage{...}*: Essa função acrescenta o valor 5 ao número passado na função store do contrat SimpleSotrage.

---
En
---
## 💻 How the Code Works

### 1️⃣ **SimpleStorage**

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract SimpleStorage {
    uint256 public myfavoriteNumber;

    struct Person {
        uint256 favoriteNumber;
        string name;
    }

    Person[] public listOfPeople;
    mapping(string => uint256) public nameToFavoriteNumber;

    function store(uint256 _favoriteNumber) public {
        myfavoriteNumber = _favoriteNumber;
    }

    function retrieve() public view returns (uint256) {
        return myfavoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        listOfPeople.push(Person(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}
```

### License and Version of the code in Solidity:

- * //SPDX-License-Identifier: MIT * : Specifies the license of the code as MIT.
- * pragma solidity ^0.8.24; *: Defines the version of the Solidity compiler, with support for more recent and compatible versions, by using the "^" symbol.

### Contract declaration

- *contract SimpleStorage { ... }*: I declare that this contract calls SimpleStorage;

###Project variable:

- *uint256 public myfavoriteNumber*: Declares a public variable ("public") that stores a 256-bit integer ("uint");

### Declaring a structure (Struct):

- *struct Person {...}*: Defines the structure ("Struct") "Person" with two properties;
- uint256 favoriteNumber* The structure will have a variable called "favoriteNumber" which will be a 256-bit integer ("uint").
- *string name* The structure will have a variable called "Name" which will be a string.

### Declare Variable

- SimpleStorage[] public listOfsimpleStorageContracts*: A dynamic array that stores SimpleStorage instances.

### Functions

- function createSimpleStorageContract() public {...}*: Creates a new instance of the SimpleStorage contract and adds it to the listOfsimpleStorageContracts array.
- *function fsStory(uint256 _simpleStorageIndex, uint256 _newSimpleStorageNumber) public {...}*: Updates the favorite number in a specific SimpleStorage instance, via the provided index.
- *function sfGet(uint256 _simpleStorageIndex) public view returns(uint256) {...}*: A viwer that only has the function of visualizing the storage value of a specified instance through the provided index.

### 3️⃣ **AddFiveStorage**

```solidity

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24; // solidity versions

import {SimpleStorage} from "./SimpleStorage.sol";


contract AddFiveStorage is SimpleStorage{
    //+5
    //override
    function store(uint256 _newNumber) public override {
        myfavoriteNumber = _newNumber + 5;
    }
}
```
### License and Version of the code in Solidity:

- * //SPDX-License-Identifier: MIT * : Specifies the license of the code as MIT.
- * pragma solidity ^0.8.24; *:  Defines the version of the Solidity compiler, with support for more recent and compatible versions, by using the "^" symbol.

### Importing Contracts:

- *import {SimpleStorage} from "./SimpleStorage.sol";*: Imports the SimpleStorage "contract" for reuse.

### Contract declaration

- *contract StorageFactory{...}*: Declares the name of this StorageFactory contract.

### Declare Variable

- *SimpleStorage[] public listOfsimpleStorageContracts*: A dynamic array that stores SimpleStorage instances.

### Functions

- function createSimpleStorageContract() public {...}*: Creates a new instance of the SimpleStorage contract and adds it to the listOfsimpleStorageContracts array.
- *function fsStory(uint256 _simpleStorageIndex, uint256 _newSimpleStorageNumber) public {...}*: Updates the favorite number in a specific SimpleStorage instance, via the provided index.
- *function sfGet(uint256 _simpleStorageIndex) public view returns(uint256) {...}*: A viwer that only has the function of visualizing the storage value of a specified instance through the provided index.

### 3️⃣ **AddFiveStorage**

```solidity

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24; // solidity versions

import {SimpleStorage} from "./SimpleStorage.sol";


contract AddFiveStorage is SimpleStorage{
    //+5
    //override
    function store(uint256 _newNumber) public override {
        myfavoriteNumber = _newNumber + 5;
    }
}
```
## License and Version of the code in Solidity:

- * //SPDX-License-Identifier: MIT * : Specifies the license of the code as MIT.
- * pragma solidity ^0.8.24; *:  Defines the version of the Solidity compiler, with support for more recent and compatible versions, by using the "^" symbol.

### Importing Contracts:

- *import {SimpleStorage} from "./SimpleStorage.sol";*: Imports the information in the SimpleStorage "contract".

### Function:

- *contract AddFiveStorage is SimpleStorage{...}*: This function adds the value 5 to the number passed in the store function of the SimpleSotrage contract.

### 🛠️ Instalação
Para instalar e executar este projeto localmente, siga os passos abaixo:

  -  1. Clone o repositório:
        
```bash
 git clone https://github.com/PabloVSS/favorite_number_contract.git
```
 -  2. Navegue até o diretório do projeto:
       
```bash
 cd favorite_number_contract
```

## 📄 Licença
Este projeto está licenciado sob a licença MIT. Veja o arquivo LICENSE para mais detalhes.

This project is licensed under the MIT license. See the LICENSE file for more details.

      
