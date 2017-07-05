export const RECEIVE_TODOS = "RECEIVE_TODOS";
export const RECEIVE_TODO = "RECEIVE_TODO";
export const REMOVE_TODO = "REMOVE_TODO";

import { APIUtil } from '../util/todo_api_util';
import {receiveErrors } from './error_actions';

export const receiveTodos = function(todos){
  return ({
    type: RECEIVE_TODOS,
    todos: todos
  });
};

export const receiveTodo = function(todo){
  return ({
    type: RECEIVE_TODO,
    todo: todo
  });
};

export const removeTodo = function(todo){
  return ({
    type: REMOVE_TODO,
    todo: todo
  });
};

export const fetchTodos = function() {
  return function(dispatch){
    return APIUtil.fetchTodos()
      .then(
        (todos) => dispatch(receiveTodos(todos)),
        (error) => console.log(error)

      );
  };
};

export const deleteTodo = function(todo) {
  return function(dispatch){
    return APIUtil.deleteTodo(todo)
      .then(
        (todos) => dispatch(removeTodo(todo))
      );
  };
};

export const createTodo = function(todo) {
  return function(dispatch){
    return APIUtil.addTodo(todo)
      .then(
        (todo) => dispatch(receiveTodo(todo)),
        (error) => {
          return dispatch(receiveErrors(error.responseJSON));
        }
      );
  };
};

export const updateTodo = function(todo) {
  return function(dispatch){
    return APIUtil.updateTodo(todo)
      .then(
        (todo) => dispatch(receiveTodo(todo)),
        (error) => {
          return dispatch(receiveErrors(error.responseJSON));
        }
      );
  };
};

window.receiveTodos = receiveTodos;
window.receiveTodo = receiveTodo;
window.removeTodo = removeTodo;
window.fetchTodos = fetchTodos;
