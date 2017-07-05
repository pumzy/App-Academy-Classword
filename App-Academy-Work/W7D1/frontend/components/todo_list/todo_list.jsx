import React from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from './todo_form';
// import {receiveTodo} from '../../actions/todo_actions';
// this is wrong. On Line 21 receiveTodo should be the dispacth action in the prop!

const TodoList = ({ todos, receiveTodo, removeTodo }) => {

  const allTodoListItems = todos.map( (item, idx) => {
    return (
      // put the unique key here since this is the array
      <TodoListItem key={item.id} todo={item} receiveTodo={receiveTodo} removeTodo={removeTodo} />
    );
  });

  return (
    <div>
      <ul>
        {allTodoListItems}
      </ul>
      <TodoForm receiveTodo={receiveTodo}/>
    </div>
  );
};

export default TodoList;
