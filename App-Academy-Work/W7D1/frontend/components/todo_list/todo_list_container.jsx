import { connect } from 'react-redux';
import TodoList from './todo_list';
import { receiveTodo, removeTodo } from '../../actions/todo_actions';
import { allTodos } from '../../reducers/selectors';

const mapStateToProps = (state) => {
  return { todos: allTodos(state) };
};

const mapDispatchToProps = (dispatch) => {
  return {
    receiveTodo: (todo) => {return dispatch(receiveTodo(todo));},
    removeTodo: (todo) => {return dispatch(removeTodo(todo));}
  };
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(TodoList);
