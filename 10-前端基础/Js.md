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
        写在外部的 
        #div {
            color :red;
        }
        无法得到。

        getComputedStyle 可以获取到，但是无法获取复合样式。
        比如，background,无法得到，但是可以得到 ——> backgroundColor

    

        jQuery  

                css -->    
                        style  --> 
                                    curCSS   --> 
                                                getComputedStyle






















