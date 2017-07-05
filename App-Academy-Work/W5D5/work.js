function sum(){
  var result = 0;
  var args =[...arguments];
  // Array.fron(arguments)
  for (i=0; i < args.length; i++){
    result += args[i];
  }
  return result;
}

// console.log(sum(1,2,3));

function sum2(...nums){
  var result = 0;
  for (i=0; i < nums.length; i++){
    result += nums[i];
  }
  return result;
}



// console.log(sum2(1,2,3))

Function.prototype.myBind = function (item, ...args) {
  return (...somethingelse) => {
     this.apply(item, args.concat(somethingelse));
  };
};

//
Function.prototype.myBind = function (item) {
  let args = Array.from(arguments).slice(1);
  let that = this;
  return function() {
    args2 = Array.from(arguments);
    that.apply(item, args.concat(args2));
  };
};

function sumarr(array){
  var result = 0;
  for (i=0; i < array.length; i++){
    result += array[i];
  }
  return result;
}

function curriedSum(numArgs) {
  let numbers = [];
  let _adder = (num) => { numbers.push(num);
  if (numbers.length === numArgs){
    return sumarr(numbers);
  }
  else {
    return _adder;
  }
};

 return _adder;
}


Function.prototype.curry = function (numArgs) {
  var that = this;
  var args = [];
  return function _currier(thing) {
    args.push(thing);
    if (numArgs === args.length) {
      return that.apply(null ,args);
    }
    else {
      return _currier;
    }
    // return (numArgs === args.length) ? that.apply(null ,args) : _currier;
  };
};

Function.prototype.curry2 = function (numArgs) {
  var that = this;
  var args = [];
    return function _currier() {
      let theseargs = Array.from(arguments);
      args = args.concat(theseargs);
      if (numArgs === args.length) {
      return that.apply(null ,args);
      }
      else {
        return _currier;
      }
  };

};

Function.prototype.inherits = function (parent) {
  function Surrogate() {}
  Surrogate.prototype = parent.prototype;
  this.prototype = new Surrogate();
  this.constructor = this.name;
};


function MovingObject () {}

function Ship () {}
Ship.inherits(MovingObject);

function Asteroid () {}
Asteroid.inherits(MovingObject);

Function.prototype.inherits2 = function (parent) {
  this.prototype = Object.create(parent.prototype);
  this.constructor = this.name;
};
