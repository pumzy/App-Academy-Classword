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
/******/ 	return __webpack_require__(__webpack_require__.s = 3);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

const Util = __webpack_require__(1);
const MovingObject = __webpack_require__(4);
const Asteroid = __webpack_require__(!(function webpackMissingModule() { var e = new Error("Cannot find module \"./asteriod.js\""); e.code = 'MODULE_NOT_FOUND'; throw e; }()));

function Game(){
  this.DIM_X = 500;
  this.DIM_Y = 500;
  this.NUM_ASTEROIDS = 30;
  this.asteroids = [];
  this.addAsteroids();
}

Game.prototype.randoPos = function () {
  a = Math.floor(Math.random() * this.DIM_X);
  b = Math.floor(Math.random() * this.DIM_Y);
  return [a,b];

};


Game.prototype.addAsteroids = function(){
  for (i = 0; i < this.NUM_ASTEROIDS; i++) {
    var hmm = new Asteroid(this.randoPos);
    this.asteroids.push(hmm);
  }
};

Game.prototype.draw = function(ctx) {
  ctx.clearRect(0,0,this.DIM_X,this.DIM_Y);
  for (i=0; i<this.asteroids.length; i++) {
    this.asteroids[i].draw(ctx);
  }
};

Game.prototype.moveObjects = function () {
  for (i=0; i<this.asteroids.length; i++) {
    this.asteroids[i].move(ctx);
  }
};

module.exports = Game;


/***/ }),
/* 1 */
/***/ (function(module, exports) {

const Util = {
  inherits (childClass, parentClass){
    childClass.prototype = Object.create(parentClass.prototype);
    childClass.constructor = childClass.name;
  }

};

module.exports = Util;


/***/ }),
/* 2 */
/***/ (function(module, exports, __webpack_require__) {

const Game = __webpack_require__(0);


function GameView (ctx, game){
  this.game = game;
  this.ctx = ctx;
}

GameView.prototype.start = function() {
  setInterval(this.game.moveObjects,20);
};

module.exports = GameView;


/***/ }),
/* 3 */
/***/ (function(module, exports, __webpack_require__) {

const Game = __webpack_require__(0);
const GameView = __webpack_require__(2);

document.addEventListener("DOMContentLoaded", function(){
  let c = document.getElementsByTagName("canvas");

  c.height = Game.DIM_Y;
  c.width = Game.DIM_X;

  const ctx = c.getContext("2d");


  const game = new Game();


  new GameView(ctx, game).start();
});


/***/ }),
/* 4 */
/***/ (function(module, exports, __webpack_require__) {

const Util = __webpack_require__(1);


function MovingObject(options){
  this.pos = options.pos;
  this.vel = options.vel;
  this.radius = options.radius;
  this.color = options.color;
}

MovingObect.prototype.draw = function(ctx){

  ctx.beginPath();
  ctx.arc(this.pos[0], this.pos[1],this.radius,0,2*Math.PI);
  ctx.fillStyle = this.color;
  ctx.fill();
  ctx.stroke();
};

MovingObect.prototype.move = function (ctx) {


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


/***/ })
/******/ ]);