export const APIUtil = {

  addTodo(todo) {
    return (
        $.ajax({
          method: 'POST',
          url: '/api/todos',
          data: { todo: todo },
          datatype: 'JSON'
        })
    );
  },

  updateTodo(todo) {
    let id = todo.id;
    return (
        $.ajax({
          method: 'PATCH',
          url: `/api/todos/${id}`,
          data: { todo: todo },
          datatype: 'JSON'
        })
    );
  },

  deleteTodo(todo) {
    let id = todo.id;
    return (
        $.ajax({
          method: 'DELETE',
          url: `/api/todos/${id}`,
          data: { todo: todo },
          datatype: 'JSON'
        })
    );
  },

  fetchTodos() {
    return (
      $.ajax({
        method: 'GET',
        url: 'api/todos'
      })
    );
  }

};
