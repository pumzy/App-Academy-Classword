import { connect } from 'react-redux';

import TodoDetailView from './todo_detail_view';
import { receiveTodo, removeTodo } from '../../actions/todo_actions';


const mapDispatchToProps = (dispatch) => {
  return {
    // receiveTodo: (todo) => {return dispatch(receiveTodo(todo));},
    removeTodo: (todo) => {return dispatch(removeTodo(todo));}
  };
};

export default connect(
  null,
  mapDispatchToProps
)(TodoDetailView);
