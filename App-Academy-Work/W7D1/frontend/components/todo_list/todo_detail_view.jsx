import React from 'react';
import { merge } from 'lodash';

class TodoDetailView extends React.Component {
  constructor(props) {
    super(props);
    // this.handleDelete = this.handleDelete.bind(this);
    this.toggleDone = this.toggleDone.bind(this);
  }


  toggleDone(event) {
    const newTodo = merge({}, this.props.todo, { done: !this.props.todo.done });
    this.props.receiveTodo(newTodo);
  }

  // handleDelete(event) {
  //   this.props.removeTodo(this.props.todo);
  // }

  render() {
    return(
      <ul>
        <li>{this.props.todo.body}</li>
        <button onClick={this.props.handleDelete}> Delete </button>
      </ul>
    );}


}


export default TodoDetailView;
