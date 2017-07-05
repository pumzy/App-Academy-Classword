import { REMOVE_TODO, RECEIVE_TODOS, RECEIVE_TODO } from '../actions/todo_actions';
import merge from 'lodash/merge';


const initialState = {
  1: {
    id: 1,
    title: "wash car",
    body: "with soap",
    done: false
  },
  2: {
    id: 2,
    title: "wash dog",
    body: "with shampoo",
    done: true
  },
};

const todosReducer = (state = initialState, action) => {
  switch (action.type) {
    case RECEIVE_TODOS:
      return (
        merge({}, state, action.todos) // merge mutate the first arg
        // Root reducer takes care of slicing.
      );

    case RECEIVE_TODO:
      const newTodo = { [action.todo.id]: action.todo };
      return (
        merge({}, state, newTodo)
      );

    case REMOVE_TODO:
      const newState = merge({}, state);
      delete newState[action.todo.id];
      return newState;
    default:
      return state;
  }
};

export default todosReducer;
