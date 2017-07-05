
import {  RECEIVE_ERRORS, CLEAR_ERRORS } from '../actions/error_actions';


const errorReducer = (state = [], action) => {
  switch (action.type) {
    case RECEIVE_ERRORS:
      return (
        action.errors // merge mutate the first arg
        // Root reducer takes care of slicing.
      );


    case CLEAR_ERRORS:
      const newState = [];
      return newState;
    default:
      return state;
  }
};

export default errorReducer;
