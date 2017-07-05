import { connect } from 'react-redux';
import TodoList from './todo_list';
import { receiveTodo, removeTodo, fetchTodos, createTodo, updateTodo } from '../../actions/todo_actions';
import { allTodos } from '../../reducers/selectors';
import { clearErrors } from '../../actions/error_actions';

const mapStateToProps = (state) => {
  return {
    todos: allTodos(state),
    errors: state.errors
  };
};

const mapDispatchToProps = (dispatch) => {
  return {
    createTodo: (todo) => {return dispatch(createTodo(todo));},
    removeTodo: (todo) => {return dispatch(removeTodo(todo));},
    fetchTodos: () => {return dispatch(fetchTodos()); },
    clearErrors: () => {return dispatch(clearErrors());},
    updateTodo: (todo) => { return dispatch(updateTodo(todo));}
  };
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(TodoList);
