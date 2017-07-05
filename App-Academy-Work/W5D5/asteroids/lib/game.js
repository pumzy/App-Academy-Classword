const Util = require("./utils.js");
const MovingObject = require("./moving_object.js");
const Asteroid = require('./asteroid.js');

function Game(){
  this.DIM_X = 500;
  this.NUM_ASTEROIDS = 30;
  this.DIM_Y = 500;
  this.asteroids = [];
  this.addAsteroids();
  this.constructor = Game;
}

Game.prototype.randoPos = function () {
  a = Math.floor(Math.random() * this.DIM_X);
  b = Math.floor(Math.random() * this.DIM_Y);
  return [a,b];

};


Game.prototype.addAsteroids = function(){
  for (i = 0; i < this.NUM_ASTEROIDS; i++) {
    var hmm = new Asteroid(this.randoPos(),this);
    this.asteroids.push(hmm);
  }
};

Game.prototype.draw = function(ctx) {
  ctx.clearRect(0,0,this.DIM_X,this.DIM_Y);
  ctx.fillStyle = "black";
  ctx.fillRect(0,0,this.DIM_X, this.DIM_Y);
  for (i=0; i<this.asteroids.length; i++) {
    this.asteroids[i].draw(ctx);
  }
};

Game.prototype.moveObjects = function (ctx) {
  for (i=0; i<this.asteroids.length; i++) {
    this.asteroids[i].move(ctx);
  }
};

Game.prototype.animate = function(ctx){
  this.draw(ctx);
  this.moveObjects(ctx);
};


Game.prototype.wrap = function(pos) {

var wrapped_pos = [];
if (pos[0] > this.DIM_X) wrapped_pos.push(1);
else if (pos[0] < 0) wrapped_pos.push(this.DIM_X);
else wrapped_pos.push(pos[0]);

if (pos[1] > this.DIM_Y) wrapped_pos.push(1);
else if (pos[1] < 0) wrapped_pos.push(this.DIM_Y);
else wrapped_pos.push(pos[1]);
return wrapped_pos;

};

module.exports = Game;
