const Util = require("./utils.js");


function MovingObject(options){
  this.pos = options.pos;
  this.vel = options.vel;
  this.radius = options.radius;
  this.color = options.color;
}

MovingObject.prototype.draw = function(ctx){

  ctx.fillStyle = this.color;
  ctx.beginPath();
  ctx.arc(this.pos[0], this.pos[1],this.radius,0,2*Math.PI, true);
  ctx.fill();
  ctx.stroke();
};

MovingObject.prototype.move = function (ctx) {


  this.pos = [(this.pos[0] + this.vel[0]), (this.pos[1], this.vel[1])];
  //
  // ctx.clearRect(startpos, this.radius*2, this.radius*2);
  // ctx.beginPath();
  // ctx.arc(endpos[0], endpos[1],this.radius,0,2*Math.PI);
  // ctx.fillStyle = this.color;
  // ctx.fill();
  // ctx.stroke();

};

module.exports = MovingObject;
