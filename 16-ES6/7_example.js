"use strict";

var obj = {
    a : 1,
    b : 2,
};

Object.observe(obj, function() {
    console.log(arguments);
})

var a = function () {

}


// setTimeout(function () {
//     obj.a = 2;
// }, 1000);


// setTimeout(function () {
//     obj.c = 3;
// }, 2000);


// setTimeout(function () {
//     delete obj.c;
// }, 3000);


// obj.prototype = {
//     add : function () {
//         console.log('111');
//     }
// }

// node 7_example.js
// { '0': [ { type: 'update', object: [Object], name: 'a', oldValue: 1 } ] }
// { '0': [ { type: 'add', object: [Object], name: 'c' } ] }
// { '0': [ { type: 'delete', object: [Object], name: 'c', oldValue: 3 } ] }



// Object.observe(obj, function() {
//     console.log(arguments);
// }, ['add']);


// $ node 7_example.js
// { '0': [ { type: 'add', object: [Object], name: 'c' } ] }

console.log(Object.keys(obj));      // [ 'a', 'b' ]

// console.log(Reflect.ownKeys(obj));  









