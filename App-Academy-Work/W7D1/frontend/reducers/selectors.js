
export const allTodos = function(state){
  let todoArray = [];
  Object.keys(state.todos).map((id) => {
    todoArray.push(state.todos[id]);// return in the map!!
  });
  return todoArray;
};
