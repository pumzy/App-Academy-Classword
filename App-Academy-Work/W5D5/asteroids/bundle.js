/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// identity function for calling harmony imports with the correct context
/******/ 	__webpack_require__.i = function(value) { return value; };
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

const Util = __webpack_require__(2);
const MovingObject = __webpack_require__(1);
const Asteroid = __webpack_require__(3);

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


/***/ }),
/* 1 */
/***/ (function(module, exports, __webpack_require__) {

const Util = __webpack_require__(2);


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


/***/ }),
/* 2 */
/***/ (function(module, exports) {

const Util = {
  inherits (childClass, parentClass){
    childClass.prototype = Object.create(parentClass.prototype);
    childClass.constructor = childClass.name;
  }

};

module.exports = Util;


/***/ }),
/* 3 */
/***/ (function(module, exports, __webpack_require__) {

const Util = __webpack_require__(2);
const MovingObject = __webpack_require__(1);
const Game = __webpack_require__(0);


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


/***/ })
/******/ ]);