## Js

### 掌握js语言特性，理解和动态语言区别
### 掌握原型链、作用域链和闭包原理
### 了解ECMAScript规范
### 掌握函数式和面向对象编程方法，包括命名空间、继承、类模拟




### Jquery event
    

    主要就是3个方法，add, remove, trigger 

    $('ul').delegate('li', 'click', function() {
        
        $(this).css('background', 'red');

    });

    delegate -> on

    
    // on 会遍历对象
    $('#div').on({
        'click': function() {

            alert(1);
        },

        'mouseover': function() {

            alert(2);
        }

    });

    
    one === 1, 一次  --> on       // 执行一次，取消就好 off， fun.apply(this, argu);


    add = 绑定    remove = 解绑    trigger = 触发
    
        以上的三个方法，与data进行交互。

            数据是绑定在元素对象上面，进行缓存和获取。


    data 缓存的数据是 ：

            var elementData = {

                events : {
                    click : [
                        {
                            data: 数据

                            guid: 累加，先后顺序

                            handler: 绑定的函数

                            namespace: 命名空间
                            
                            origType：click,原始的type类型
                            
                            selector： 代理的标签，

                            needsContext:  （1）有委托的是false，没有是undefined。
                            （2）伪类的情况 span:first, 为true

                            type ： 现在的类型
                        
                        },
                        {},
                        ...
                    ],
                    mouseover : [
                        {},
                        ....
                    ],

                    length : N,

                    delegateCount : M       // 委托的计数

                    ...
                },

                handle : function () {


                }

            }



        <!-- 主动触发 -->
        $('#div').on('click.aaa', funciton () {
            alert('aaa.click);
        });
        $('#div').on('click.bbb', funciton () {
            alert('bbb.click);
            return false;   // 阻止冒泡和默认事件
        });

        $('#div').trigger('click');         // 都触发
        $('#div').trigger('click.aaa');     // bbb就不触发



        数据的结构是是来代表参数的维度。


        on (参数绑定)
            --> 
            event.add (事件添加)
            event.remove (事件删除)
                    --> 
                    event.dispatch (分发事件具体操作)
                        --> event.global   事件的全局属性
                        --> event.props    共享原生JS事件 
                        --> event.fixHooks 具体的兼容
                        --> event.keyHooks 键盘的兼容
                        --> event.mouseHooks 鼠标的兼容
                        --> event.fix      兼容 event
                        --> event.special  兼容 特殊事件
                        --> event.handlers 执行顺序 队列



        方法共同维护了队列（参数，事件，属性），进行事件驱动。


### Jquery DOM 操作
    
    jQuery.fn.extend({
        
        has
        not
        filter
        closest 最近的祖先节点（包括自身）
        find
        is
        index        索引
        add          添加元素到集合 
        addBack      既可以添加，又可以返回栈的下一层。
    
    });


    方法
        filter  ——  过滤 $('#div').filter(".box") ;类是box的条件。
        not 跟filter相反。has 是子项上。
        

        insert
        before
        append
        ...


### Jquery CSS 操作
    
        $('div').get(0).style.color = 'red';    // 只能获取行间样式。
        写在外部的,是无法获取的
        #div {
            color :red;
        }
        style是无法得到。

        getComputedStyle 可以获取到外部的样式，但是无法获取复合样式。
        比如，background,无法得到，但是可以得到 ——> backgroundColor



        jQuery  

                css -->    
                       style(不能获取，只能设置)  --> 
                                        curCSS   --> 
                                                getComputedStyle


            css(['color', 'backgroundColor', 'width']);
            css({width:200, height:200});


        
        jQuery.
                style()  设置
                css()    兼容，获取
                curCSS() 兼容
                getStyle() -> [getComputedStyle]
                
                
                    vendorPropName 厂商前缀
                    cssHooks 透明度处理
                    

                toggle
                show
                hidden
                isHidden
                css_displayDefault
                actualDisplay   // 动态创建

            
                contentWindow   //iframe 里面的属性

    


### jQuery.offset
        
            window.innerHeight  // 屏幕显示区域的高度
            window.innerWidth   // 屏幕显示区域的宽度

            jQuery.
                    width()                 // L
                    innerWidth()            // width = L - padding
                    outerWidth()            // width = L - padding -border
                    outerWidth(L, true)     // width = L - padding -border -margin

                    support                 // 判断支持

                    setPositiveNumber
                    getWidthOrHeight
                    augmentWidthOrHeight


### ajax
        

       jQuery.param     把JSON转了，序列化。

           var obj = {a:111; b:222};
           var str = param(obj);
           str = "a=111&b=222" ;
           decodeURIComponent($.param(obj));    // 有的中文或者编码


        buildParams

        serialize           // 序列表表格内容为字符串，用于 Ajax 请求。将表单的数据搞定。
    
        serializeArray      // elements 这个属性
        

        ajax 
            {
                ajaxSettings                // 写了很多默认的参数

                ajaxSetup([options])        // 工具方法，让options配置方法，继承ajaxSettings

                ajaxPrefilter([type],fn)        // 过滤器，做url处理的，比如跨域
                    本地的走ajax,
                    跨域的是动态创建 script 标签。
                
                ajaxTransport                   // 根据过滤器，进行分发处理。
                    动态分发器，承接将上面的函数，进行ajax的动态分发。

                ajaxConvert                 // 类型转换器


                ajax 请求
                    ajax(url,[settings])
                    load(url,[data],[callback])     // 载入远程 HTML 文件代码并插入至 DOM 中。
                            $.load('index.html ol', {hg:123}, function (a, b, c) {
                                
                                // 加载的HTML
                                
                            });
                                hg 是一个post的方法，提交出去的数据。

                    get(url,[data],[fn],[type])
                    getJSON(url,[data],[fn])
                    getScript(url,[callback])       // 可以执行js
                    post(url,[data],[fn],[type])
                    
                ajax 事件
                    ajaxComplete(callback)
                    ajaxError(callback)
                    ajaxSend(callback)
                    ajaxStart(callback)
                    ajaxStop(callback)
                    ajaxSuccess(callback)

            }


        
        $.ajax().done(funciton () {

        }).fail()

        complete



        $.ajax({
            url : "some thing",
            type : "POST",      // 默认是get
            dataType : "jsonp"
            success : function () {

            },
            
            error : function () {

            }

        })

        调用 ajaxSettings 去更新。 

        


        再触发ajax之前，会有ajaxStart事件


            $(document).on('ajaxStart', function () {
                alert(0);
            });
            
        $ajax({
            
            global:false;   // 关闭
            processData :  true     // 数据串联化处理, false 关闭        
            async           // 异步
            timeout :       // 超时, 超时提示。
            data : 
            dataType ： 
            username:       xhr.open(options.type, url, async, username, password); 
            password:       服务器身份验证，非必需。
            cache:          缓存
            throws;
            traditional;
            headers;

        })            



### 闭包
    
    闭包是指一个函数或者函数的引用，与一个引用环境绑定在一起，
这个引用环境是一个存储该函数每个非局部变量（也叫自由变量）的表。

    闭包不同于一般的函数，它允许一个函数在立即词法作用域外调用时，
仍可以访问非本地变量。



### 作用域
    
    全局
    函数（独立作用域）
    eval（作用域）

    (funciton () {

    })()

    !function () {

    }()

    +function () {

    }()

    是将函数变为表达式，而不是函数声明。


### 执行上下文
    
    执行上下文（Execution Context, 缩写EC）

        是堆栈，层层压入。

        变量对象(variable Object 缩写为VO)是一个抽象的“对象”，
    他拥有存储执行上下文中的：变量，函数声明，函数参数。


    全局上下文初始化：

        VO(globalContext) === [[global]];

        [[global]] = {
            Math:
            String:
            isNaN: function() {[native Code]}
            ...
            ...
            window:golbal //applied by browser(host)
        };

        GlobalContextVO     (VO === this === global)

        
        String(10);         [[global]].String(10);
        window.a=10;        [[global]].window.a=10
        this.b=20;          [[global]].b=20


    函数中，还有一个激活对象，叫AO
    
        VO(functionContext) === AO

        AO = {
            arguments;<Arg0>
        };

        arguments = {
            callee,
            length,
            properties-indexes
        };

    
        例子：

            function test(a, b) {
                var c = 10;
                function d() {

                };

                var e = function _e() {
                };

                (function x() {});
                b=20;
            }

            test(10);

            （1）首先是全局上下文，
            （2）就是函数上下文初始化。
            
            —— 变量初始化：
                AO(test) = {
                    a:10,
                    b:undefined,
                    c:undefined,
                    d:<ref to func "d">,
                    e:undefined
                }

            —— VO 执行顺序，并初始化。
                1） 函数参数（传入，就放入对应的值，若未传入，初始化参数为undefined）
                2） 函数声明（若发生命名冲突，覆盖）
                3） 变量声明（初始化为undefined， 若发生命名冲突，会省略）


            声明和未声明是有很大区别的，声明未赋值使用，是undefiend。
            未声明使用，是对报错的。Uncaught ReferenceError
                
                (function aa(x, y) {
                  console.log(x);
                  var x = 10;
                  function x() {

                  }
                  console.log(x);
                })(1,2)
                

                --> 执行结果：
                    function x() {

                    }
                    10
                
                var x=10; 是会被前置处理，执行的时候才会赋值。
                function x 会覆盖 变量x，
                但是，var x =10; 是被后执行的，此时的x＝10；

            
            —— 执行阶段：
                赋值，
                函数执行，
                函数表达式，
                函数自执行。


### 面向对象OOP

        ES5 
            object.getPrototypeOf() 获取__proto__指向的Prototype对象。
    

        原型链：层层 嵌套 查找。


            有一些要注意的点，

        1）被重写的prototype原型，会发生什么？

                function A() {

                }
                A.prototype.x = 10;

                var a = new A();
                A.prototype = {y:1};
                console.log(a.x);   //10 还是可以打印出来
                
                var b = new A();
                console.log(b.x);   // undefined
                console.log(b.y);   // 1
                

                被重新赋值的prototype，对之前已经定义的没有影响，但是之后创建的，有影响。


        2）
            instanceof

                右边是函数，左边是对象。
            
            ［1,2］instanceof Array  === true

             

        3）
            实现继承的方式；

            function A() {

            }

            function B() {

            }

        //--------------------------------------------------
            if (!Object.create) {
                Object.create = function(proto) {
                    function F() {}
                    F.prototype = proto;
                    return new F;
                };
            }

            B.prototype = Object.create(A.prototype);
        //--------------------------------------------------

        4) 
            模拟重载

                无法用参数的重载，来解决。
                但是犹豫是弱类型的，可以通过判断参数的个数和类型，进行重载。



            function A(n) {
                this.n = n;
            }

            function B(n, b) {
                this.b = b;
                A.call(this, n);
            }

        5）
            模块化

            sea,require,commonjs



















        


