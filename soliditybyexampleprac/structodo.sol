// SPDX-License-Identifier: GPL-3.0


pragma solidity>=0.4.16 <0.9.0;


contract TodoStruct{

    struct Todo{
        string text;
        bool completed;
    }

    Todo[] todo;

    function create_todo(string memory _text, bool _completed) public{
        todo.push(Todo(_text,_completed));
    }

    function get_todo(uint _index) public view returns(Todo memory){

        return todo[_index];

    }

    function update_text(uint _index,string memory _text) public {

        Todo storage to_update=todo[_index];

        to_update.text=_text;

    }

        function toggleCompleted(uint256 _index) public {
        Todo storage todo_comp = todo[_index];
        todo_comp.completed = !todo_comp.completed;
    }




}