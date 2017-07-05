import React from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from './todo_form';
// import {receiveTodo} from '../../actions/todo_actions';
// this is wrong. On Line 21 receiveTodo should be the dispacth action in the prop!

class TodoList extends React.Component {
  constructor(props) {
    super(props);
  }



  componentDidMount() {
    this.props.fetchTodos();
  }

  render() {
    const { todos, removeTodo, createTodo, errors, clearErrors, updateTodo } = this.props;

    const allTodoListItems = todos.map( (item, idx) => {
      return (
        // put the unique key here since this is the array
        <TodoListItem key={idx} todo={item} updateTodo={updateTodo} removeTodo={removeTodo} />
      );
    });

    return (
      <div>
        <ul>
          {allTodoListItems}
        </ul>
        <TodoForm createTodo={createTodo} errors={errors} clearErrors={clearErrors} />
      </div>
    );
  }
}

export default TodoList;
