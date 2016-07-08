//看看一般Promise的用法
// promise = new Promise(function(resolve, reject) {
//   //...
//     resolve(1);
//   //...
// })
// .then(function(val){}, functioin(err){})
// .then(function(val){}, functioin(err){})


/*

    function resolve () {
        //success
    }

    function reject () {

    }

    new Promise(resolve, reject) {

        // 逻辑
    }
    .then(f1, f2)
    .then(f1, f2)
    .then(f1, f2)


        ->fail
        ->success



    promise.then(
        fun1() {

            // 成功之后

        }, fun2() {
            // 失败

    })





 */



//  Promise对象接收一个函数
//  该函数有两个参数，
//  这两个参数是函数
function Promise(resolver) {
    debugger

    var queue = []; //链式调用数组
    resolver(resolve, reject);
    console.log(resolver);

    function next(state, val) {
        var arr;
        var chainRs;
        //一个Promise后面又可以有多个then，为了使resolve晚于then执行，用一个setTimeout
        setTimeout(function() {
            if (arr = queue.shift()) {
                chainRs = arr[state](val);
                if (!chainRs)
                    return;
                //某一个resolve函数返回的又是一个Promise对象
                if (chainRs && typeof chainRs.then == 'function') {
                    chainRs.then(resolve, reject);
                } else {
                    //resolve函数返回一个普通的值
                    resolve(chainRs) //.then(resolve, reject);
                }
            }
        }, 0);
    }

    function resolve(x) {       // 成功
        next(0, x);
    }

    function reject(reason) {   // 失败
        next(1, reason);
    }

    //  Promise最明显的特征 是可以then  then接收两个参数
    //  then就是将传入的函数放入队列中
    this.then = function(resolve, reject) {
        console.log('then');
        queue.push([resolve, reject]);      //resovle  reject  这两个参数也都是函数
        return this;
    }
}


// Promise.all = function(promises) {
//     var len = promises.length;
//     var results = [];

//     return new Promise(function(resolve) {
//         promises.forEach(function(p, i) {
//             p.then(function(data) {
//                 results[i] = data;
//                 len--;
//                 if (len == 0) {
//                     resolve(results);
//                 }
//             }, function(err) {
//                 console.log(err);
//             });
//         });
//     });
// }


debugger



// 例子——1
var test = new Promise(function (resolve, reject) {
    setTimeout(function () {
        console.log('success');
        resolve("OK");
    }, 1000);
}).then(function(data) {
        console.log('fuckIE', data);
    });

// 执行顺序
// 1） new ——> 进入Promise函数；
// 2） 执行Promise传入的函数；
// 3） 继续执行Promise 对象内的函数初始化；
// 4） 内部then赋值；
// 5） 执行外面的then,等待,Promise内部函数执行。结果。
















// var p = new Promise(function(resolve, reject) {
//     setTimeout(function() {
//       resolve('over');
//     }, 1200);

//   }).then(function(data) {
//         console.log(data);      // ok
//         // resolve('111');      // 执行会报错，因为resolve不存在，函数不是一个primise对象
//         // return 555;
//         return new Promise(function(resolve){
//           setTimeout(function(){
//             resolve('wahaha');
//           }, 2200);
//         })

//       }, function () {

//   }).then(function(data) {
//     console.log('2nd then', data);  //wahaha

//     // resolve
//     // reject

//     // return 666;
//   })
//   .then(function(data) {
//     console.log('3rd then', data);
//   });
