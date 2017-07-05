import { connect } from 'react-redux';

import TodoDetailView from './todo_detail_view';
import { receiveTodo, removeTodo, deleteTodo } from '../../actions/todo_actions';


const mapDispatchToProps = (dispatch) => {
  return {
    deleteTodo: (todo) => {return dispatch(deleteTodo(todo));}
  };
};

export default connect(
  null,
  mapDispatchToProps
)(TodoDetailView);



// updateTodo: (todo) => {return dispatch(updateTodo(todo));},
