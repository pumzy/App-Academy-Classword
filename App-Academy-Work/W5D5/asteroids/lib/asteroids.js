const Game = require("./game");
const GameView = require("./game_view");

document.addEventListener("DOMContentLoaded", function(){
  let c = document.getElementById("game-canvas");

  const game = new Game();

  c.height = game.DIM_Y;
  c.width = game.DIM_X;

  const ctx = c.getContext("2d");




  new GameView(ctx, game).start();
});
