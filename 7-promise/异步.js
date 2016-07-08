/*
 关注繁琐的异步编程比较复杂，
 那么将异步转为同步。
 只是看起来同步了。
 */


// 定义 存储promise 对象
var Promise = function() {sublimeLinter
    /* initialize promise */
};



// 接受两个参数用于处理完成和拒绝状态
Promise.prototype.then = function(onResolved, onRejected) {
    /* invoke handlers based upon state transition */
};

// 两个方法来执行理从未完成到已完成和从未完成到拒绝的状态转变
Promise.prototype.resolve = function(value) {
    /* move from unfulfilled to resolved */
};
Promise.prototype.reject = function(error) {
    /* move from unfulfilled to rejected */
};

// when来存储准备调用的promise对象,
Promise.when = function() {
    /* handle promises arguments and queue each */
    alert();
    alert(0);
};


/*
    Promise 也有一些缺点。

    第一，无法取消 Promise，一旦新建它就会立即执行，无法中途取消。
    第二，如果不设置回调函数，Promise 内部抛出的错误，不会反应到外部。
    第三，当处于 Pending 状态时，无法得知目前进展到哪一个阶段（刚刚开始还是即将完成）。
*/



// 使用promise
// promise
//          Pending -> Resolved
//          Pending -> Rejected

var promise = new Promise(function(resolve, reject) {
    if ( /* 异步操作成功 */ ) {
        resolve(value);
    } else {
        reject(error);
    }
});

promise.then(function(value) {
    // success
}, function(value) {
    // failure
});