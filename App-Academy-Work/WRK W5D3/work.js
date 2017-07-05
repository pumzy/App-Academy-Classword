function uniq(arr) {
let result = [];
arr.forEach(function(el) {
  if (result.includes(el)) {
  }
  else {
    result.push(el);
  }
});
return result;
}

function twoSum(arr) {
  let result = [];
  var i = 0;

  while (i < arr.length){
   var j = i + 1;
   while (j < arr.length) {
       if (arr[i] + arr[j] === 0) {
        result.push([i,j]);
      }
    j++ ;
    }
  i++ ;
  }
  return result;
}


// console.log(twoSum([-1, 0, 2, -2, 1]));

function transpose(array) {
  var i = 0;
  var result = [];
  while(i < array.length) {
    var subarray = [];
    array.forEach(function(el) {
      subarray.push(el[i]);
    });
    result.push(subarray);
    i++;
  }
return result;
}
//
// console.log(transpose([
//     [0, 1, 2],
//     [3, 4, 5],
//     [6, 7, 8]
//   ]));

function myEach(array, cb) {
  i = 0;
  dup = array;
  while (i < array.length) {
    cb(dup[i]);
    i++;
  }
}

function callback(number) {
   return number + 1;
}


function myMap(array, cb) {
  result = [];
  myEach(array, function(el) {
    result.push(cb(el));
      });
  return result;
}

// var arr = [1,2,3];
//
// console.log(myInject(arr, sum));


// console.log(myEach(arr, callback));
// console.log(arr);


function myInject(array, cb, acc = 0) {
  myEach(array, function(el) {
    acc = cb(acc, el);
    });
  return acc;
}

function sum(a, b) {
  return a + b;
}

function bubbleSort(array) {
  var sorted = false;
  while (sorted === false) {
    var i = 0;
    sorted = true;
    while (i < array.length - 1) {
      if (array[i] > array[i+1]) {
        var jval = array[i+1];
        array[i+1] = array[i];
        array[i] = jval;
        sorted = false;
      }
      i ++;
    }
  }
  return array;
}
//
// let arr = [2,6,2,8,3,5];
// console.log(bubbleSort(arr));

function subStrings(string) {
  result = [];
  i = 0;
  while (i < string.length) {
    j = i;
    while (j < string.length ){
      result.push(string.slice(i,j+1));
      j++;
    } i++;
  }
  return result;
}

//
// let string = "hello";
// console.log(subStrings(string));

function range(start, finish){

  let arr  = [finish];
  if (finish < start) {
    return [];
  }
  arr = arr.concat(range(start,finish-1));
  return arr;
}


function range2(start, finish) {
  return finish < start ? [] : [finish].concat(range(start,finish-1));
}

const range3 = (s, f) => f < s ? [] : [f].concat(range(s,f-1));


// console.log(range3(5,10));


function exp1(base, num){
  if (num === 0) {
    return 1;
  }
  return base * exp1(base, num-1);
}

// console.log(exp1(4,3));


function exp2(base, num){
  if (num === 0) return 1;
  return num%2 === 0 ? exp2(base, num / 2) * exp2(base, num / 2) : base * (exp2(base, (num - 1) / 2) * exp2(base, (num - 1) / 2));
}

// console.log(exp2(4,4));

function fibbonaci(n){
  if (n === 1) return [1];
  if (n === 2) return [1,1];

  return fibbonaci(n-1).concat([fibbonaci(n-1)[n-2] + fibbonaci(n-1)[n-3]]);

}

// console.log(fibbonaci(10));

function bsearch(array, number){
  if (array.length === 0 ) return null;
  let mid = Math.floor(array.length/2);
  let left = array.slice(0, mid);
  let right = array.slice(mid+1, array.length);

  if (array[mid] === number) return mid;
  else if (number > array[mid]) {
     return bsearch(right, number) + mid + 1;
  }
  else return bsearch(left, number);

}

// console.log(bsearch([1,2,3,4,5,6], 4));

function makeChange(array, target){
  if (target === 0) return [];
  if (array.every(function biggerThanSum(element, index, array) {return element > target ;})) return null;

  var bc = null;
  array.forEach(function(el) {
    if (el > target) return;
    let remainder = target - el;

    let br =  make_change(array.slice(1,array.length), remainder);



    if (br === null) return;
    let this_change = br + [el];
    if (bc === null || this_change.length < bc.length ) {
      bc = this_change;
    }
    }
);
return bc;
}

// console.log(make_change([10, 7, 1], 14));

function sortedMerge(array1,array2) {
var result = [];
while (array1.length > 0 && array2.length > 0) {
  if(array1[0] > array2[0]) result.push(array2.shift());
  else result.push(array1.shift());
}
return result.concat(array1.concat(array2));
}

function mergeSort(array){
  if (array.length === 1) return array;
  let pivot = array[0];
  let right = array.slice(1, array.length);
  let left =  array.slice(0,1);

  return sortedMerge(mergeSort(left), mergeSort(right));
}

// console.log(mergeSort([1,5,7,3,2,75,3,2,6336,9]));

function subsets(array){
  var result = [];
  if (array.length === 0) return [[]];



  var first = array[0];
  let newarr = array.slice(1,array.length);
  arr2 = subsets(newarr);

  result.push(arr2);
  result.push(arr2.concat(arr2.map (function (element,index,array){
    element.concat([first]);
  }
  )
  )
);
return ;
}


console.log(subsets([1,2,3]));
