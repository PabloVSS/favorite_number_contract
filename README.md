# 📝 Contracts Favorite Number

Este é o meu primeiro projeto utilizando **Solidity**, onde desenvolvi **três contratos inteligentes** com a funcionalidade de armazenar, gerenciar, listar e mapear o nome e o número favorito de uma pessoa. Além disso, o projeto explora a extensão e modificação de contratos existentes.  
O objetivo principal é aprender e compreender os fundamentos básicos da criação e implementação de contratos inteligentes na blockchain.

---

## 🎯 Objetivo

- Aprender o básico sobre a construção de contratos inteligentes.
- Praticar conceitos como armazenamento de dados, estruturas de contrato e boas práticas de desenvolvimento em **Solidity**.

---

## 🛠️ Contratos

### 1️⃣ **SimpleStorage**
Este contrato permite adicionar o nome de uma pessoa e o número favorito dela. Ele armazena e gerencia os números favoritos, além de listar e mapear os dados por nome.

### 2️⃣ **StorageFactory**
Gerencia múltiplas instâncias de contratos **SimpleStorage**, permitindo criar e interagir com eles.

### 3️⃣ **AddFiveStorage**
Extende a funcionalidade do **SimpleStorage**, adicionando um valor fixo (5) ao número favorito.

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
- * pragma solidity ^0.8.24; *: Define a versão do compilador Solidity. O símbolo ^ indica que versões mais recentes, compatíveis com a especificada, podem ser usadas.

### Declaração do contrato

- *contract SimpleStorage { ... }*:  Declaro que esse contrato terá o nome de SimpleStorage;

###Variável do projeto:

- *uint256 public myfavoriteNumber*: declaramos público ("public") que a variavel "myFavoriteNumber" será um inteiro ("uint") com 256 bits ("256");

### Declarando uma estrutura (Struct):

- *struct Person {...}*: A estrutura ("Struct") será chamada de "Person";
- *uint256 favoriteNumber* A estutura terá uma variável chamada "favoriteNumber" que será um inteiro("uint") com 256 bits("256")
- *string name* A estutura terá uma variável chamada "Name" que será um string("string"), a string é uma sequência alfanúmerico.

### Array Dinamico e mapeamento

- *Person[] public listOfPeople* Cria um Array dinâmico publico de "Person[]" chamado "listOfPeople";
- *mapping(string => uint256) public nameToFavoriteNumber*: Declara um mapeamento público associando um nome (string) em um número favorito(uint256)

Funções:

- *function store(uint256 _favoriteNumber) public {...}* : Adiciona os números favoritos ("myFavoriteNumber") na variavel chamada _favoriteNumber.
- *function retrieve() public view returns (uint256) {...}* : Função pública a vizualizar o número favorito  (myfavoriteNumber), para isso utiliza o view par aidentificar que é somente para vizualização;
- *function addPerson(string memory _name, uint256 _favoriteNumber) public {...}*:  Adicionar uma nova pessoa ao array "listOfPeople" e atualiza os dados realizando o mapeamento nameToFavoriteNumber[_name] = _favoriteNumber, com o nome e o número favorito;
 



## 💻 Explicando os Códigos

### 1️⃣ **StorageFactory**

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
- * pragma solidity ^0.8.24; *: Define a versão do compilador Solidity. O símbolo ^ indica que versões mais recentes, compatíveis com a especificada, podem ser usadas.

### Importação dos Contratos:


