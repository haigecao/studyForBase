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

        








































