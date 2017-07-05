const Util = {
  inherits (childClass, parentClass){
    childClass.prototype = Object.create(parentClass.prototype);
    childClass.constructor = childClass.name;
  }

};

module.exports = Util;
