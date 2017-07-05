const Game = require("./game.js");


function GameView (ctx, game){
  this.game = game;
  this.ctx = ctx;
}

GameView.prototype.start = function() {
  this.game.draw(this.ctx);

  setInterval(this.game.animate.bind(this.game, this.ctx),500);
};

module.exports = GameView;
