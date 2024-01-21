// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Todos {

    struct Todo { //A struct to store To Do items
        string text; //text description of tasks
        bool completed; //status of task completed or not
    }

    Todo[] public todos; // An array of 'Todo' structs to store all tasks

    function create(string calldata _text) public {

        //there are 3 ways of intialising strcts.
        //<Refer to structs.sol for details>

        todos.push(Todo(_text, false)); //initialisation done like function call

    }

    /*
    Solidity automatically creates a getter for 'todos' so, the below function is not needed in practice
    //function get(uint _index) public view returns (string memory text, bool completed) {
    //    Todo storage todo = todos[_index];
    //    return (todo.text, todo.completed);
    }
    */

    function updateText(uint _index, string calldata _text) public { //function for updating the todo description
        Todo storage todo = todos[_index]; //creating a copy of the required todo item in storage for updating it
        todo.text = _text; //updating the todo item
    }

    function toggleCompleted(uint _index) public { //function for updating the status of todo
        Todo storage todo = todos[_index]; //creating a copy of the required todo item in storage for updating it
        todo.completed = !todo.completed; //reversing the status of boolean completed
    }
}

//funcion modifiers can be used to make this contract more efficient and readable.