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
      // debugger;
      let todosObject = {};
      action.todos.forEach( (todo) => {
        todosObject[todo.id] = todo;
      });
      return todosObject;

    // Root reducer takes care of slicing. no need for state.todos
    // action.todos is an array, when using merge({}, action.todos)
    // object are unordered, so every time we refresh, the order might change,
    // causing the descrepency of the index and the todo.id
    // thus we interate the action.todos array and set key/value pairs in the todosObject

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
