const Util = require("./utils.js");
const MovingObject = require("./moving_object.js");
const Game = require("./game.js");


const defaults = {
color: "blue",
radius:50
};

function randomVec (length) {
  const deg = 2 * Math.PI * Math.random();
  return scale([Math.sin(deg), Math.cos(deg)], length);
}
// Scale the length of a vector by the given amount.
function scale (vec, m) {
  return [vec[0] * m, vec[1] * m];
}



function Asteroid(pos, game, options = {}) {
  options.color = defaults.color;
  options.radius = defaults.radius;
  options.vel = randomVec(options.radius);
  options.game = game;

  options.pos = options.game.wrap.call(this.game, pos);
  

  MovingObject.call(this, options);
}

Util.inherits(Asteroid, MovingObject);


module.exports = Asteroid;
