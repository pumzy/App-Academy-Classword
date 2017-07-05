import React from 'react';
import { merge } from 'lodash';

class TodoDetailView extends React.Component {
  constructor(props) {
    super(props);
    this.handleDelete = this.handleDelete.bind(this);
    // this.toggleDone = this.toggleDone.bind(this);
  }


  handleDelete(event) {
    event.preventDefault();
    this.props.deleteTodo(this.props.todo);
    this.props.toggleDetail();
  }

  render() {
    return(
      <ul>
        <li>{this.props.todo.body}</li>
        <button onClick={this.handleDelete}> Delete </button>
      </ul>
    );}


}


export default TodoDetailView;
