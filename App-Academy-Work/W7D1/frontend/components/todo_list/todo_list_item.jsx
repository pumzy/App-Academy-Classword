import React from 'react';
import { merge } from 'lodash';
import TodoDetailView from './todo_detail_view';

class TodoListItem extends React.Component {
  constructor(props) {
    super(props);
    this.handleDelete = this.handleDelete.bind(this);
    this.toggleDone = this.toggleDone.bind(this);
    this.toggleDetail = this.toggleDetail.bind(this);
    this.state = {
      detail: false
    };
  }

  toggleDetail(event) {
    this.setState({
      detail: !this.state.detail
    });
  }

  toggleDone(event) {
    const newTodo = merge({}, this.props.todo, { done: !this.props.todo.done });
    this.props.receiveTodo(newTodo);
  }

  handleDelete(event) {
    this.props.removeTodo(this.props.todo);
  }

  render() {
    let detailView = null;
    if (this.state.detail) {
      detailView = <TodoDetailView todo={this.props.todo} handleDelete={this.handleDelete}/>;
    }
    return(
      <li>
      <p onClick={this.toggleDetail}>{this.props.todo.title}</p>
      <br />
      <button onClick={this.toggleDone}>{this.props.todo.done ? 'UNDO' : 'DONE'}</button>
      {detailView}
      </li>
    );}


}


export default TodoListItem;
