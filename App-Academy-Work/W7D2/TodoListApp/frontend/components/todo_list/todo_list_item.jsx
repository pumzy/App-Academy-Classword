import React from 'react';
import { merge } from 'lodash';
import TodoDetailViewContainer from './todo_detail_view_container';
// in order to use the dispatch functionalities defined in the container, we should
// import the container component, not the presentational component

class TodoListItem extends React.Component {
  constructor(props) {
    super(props);

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
    this.props.updateTodo(newTodo);
  }

  render() {
    let detailView = null;
    const { todo, updateTodo } = this.props;
    if (this.state.detail) {
      detailView = <TodoDetailViewContainer todo={todo} toggleDetail={this.toggleDetail}  />;
    }
    return(
      <li>
      <p onClick={this.toggleDetail}>{todo.title}</p>
      <br />
      <button onClick={this.toggleDone}>{todo.done ? 'UNDO' : 'DONE'}</button>
      {detailView}
      </li>
    );}


}


export default TodoListItem;
