
export const allTodos = function(state){
  // part 1, when id is generated so it's not consecutive
  // let todoArray = [];
  // Object.keys(state.todos).map((id) => {
  //   todoArray.push(state.todos[id]);// return in the map!!
  // });
  // return todoArray;

  // part 2, id is generated automatically by the db
  return Object.keys(state.todos).map((id) =>  state.todos[id] );

};
