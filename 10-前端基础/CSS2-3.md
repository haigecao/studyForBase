## 掌握css选择器覆盖规则
## 掌握盒模型，元素定位
## 了解base64图片，css-sprite


### 1）CSS 选择器覆盖规则
    
    规则一：由于继承而发生样式冲突时，最近祖先获胜。就进原则。
        
        例子：如果a，b中都有color，span首先选择b类的。前提是没用类似important这种。
            <div class='a'>
                <p class="b">
                    <span>test</span>
                </p>
            </div>
        

    规则二：继承的样式和直接指定的样式冲突时，直接指定的样式获胜。

        上面的例子，strong { color: red}, 首选自己的。


    规则三：直接指定的样式发生冲突时，样式权值高者获胜。

        内联 > ID > class > lable

        并没有叠加以后会越级的可能。

    规则四：样式权值相同时，后面会覆盖前面的。

        .A {
            color : "red";
            color : "blue";
        }
        blue 覆盖 red



    规则五：!important的样式属性不被覆盖，这属性慎用。





## 2）掌握盒模型，元素定位
    
    盒模型 ： IE 和 W3C

        标准W3C盒子模型：

            width= content 的宽度
            height = content 的高度
            盒子的宽度 ＝ 2 * margin-left + 2 * border-left + 
                        2 * padding-left + content-width;

            盒子的高度 ＝ 2 * margin-top + 2 * border-top +
                        2 * padding-top + content-height;


        IE盒子模型：

            width = content + border + padding
            height = content + border + padding

            盒子的宽度 = width + margin
            盒子的高度 = height + margin

    
    元素定位：
        
        首先，定位的原理很简单，就是相对定位。相比于正常的位置该出现的位置，或者相对于父元素，
    或者相对浏览器窗口本身的位置。浏览器内的元素，一切都是框。通过display来设定属性。

        先，描述一下块元素和行内元素。

        块级元素——高度和宽度都可以设定。比如div,p,ul等，块级元素默认状态下都是占据一个整行。
        内联元素——这个宽高不可以设定，其宽度就是自身文字或者图片宽度。a、span、em等。
    

        块级元素：
                     address - 地址
                     blockquote - 块引用
                     center - 举中对齐块
                     dir - 目录列表
                     div - 常用块级容易，也是css layout的主要标签
                     dl - 定义列表
                     fieldset - form控制组
                     form - 交互表单
                     h1 - 大标题
                     h2 - 副标题
                     h3 - 3级标题
                     h4 - 4级标题
                     h5 - 5级标题
                     h6 - 6级标题
                     hr - 水平分隔线
                     isindex - input prompt
                     menu - 菜单列表
                     noframes - frames可选内容，（对于不支持frame的浏览器显示此区块内容
                     noscript - ）可选脚本内容（对于不支持script的浏览器显示此内容）
                     ol - 排序表单
                     p - 段落
                     pre - 格式化文本
                     table - 表格
                     ul - 非排序列表

        行内元素：
                     a - 锚点
                     abbr - 缩写
                     acronym - 首字
                     b - 粗体(不推荐)
                     bdo - bidi override
                     big - 大字体
                     br - 换行
                     cite - 引用
                     code - 计算机代码(在引用源码的时候需要)
                     dfn - 定义字段
                     em - 强调
                     font - 字体设定(不推荐)
                     i - 斜体
                     img - 图片
                     input - 输入框
                     kbd - 定义键盘文本
                     label - 表格标签
                     q - 短引用
                     s - 中划线(不推荐)
                     samp - 定义范例计算机代码
                     select - 项目选择
                     small - 小字体文本
                     span - 常用内联容器，定义文本内区块
                     strike - 中划线
                     strong - 粗体强调
                     sub - 下标
                     sup - 上标
                     textarea - 多行文本输入框
                     tt - 电传文本
                     u - 下划线
                     var - 定义变量
    

    定位：CSS有3种方式，普通定位、浮动和绝对定位。
        
        看看如何定位：

            （1）static 默认值。没有定位，元素出现在正常的流中
            （2）relative 生成相对定位的元素，相对于其正常位置进行定位。
            （3）absolute 生成绝对定位的元素，相对于 static 定位以外的第一个父元素进行定位。
            （4）fixed 生成绝对定位的元素，相对于浏览器窗口进行定位。
            （5）inherit 规定应该从父元素继承 position 属性的值。

        
        定位的方式，无外乎，绝对定位，相对定位，按层级定位。

        所谓流逝就是从上到下，从左到右。如果DOM写的合理，那z-index用的会很省力，甚至也许只用
    z-index不会超过1，都有可能，解决的很好，关键还是看DOM写的是不是优雅。
        原则，如果不给节点设计属性，后面可以覆盖前面的——顺序规则。
    
        （a）z-index 属性必须在position为absolute,fixed,或者relative时才有用。
        （b）A、B节点都定义了position:realitive;
            A的z-index比B大，那么，A内的所有节点都会在B的上面，即使z-index比B小。
            总结就是，子节点再大，也无法超越父节点。
        

    这篇博客写的很酷，好犀利。
        http://www.neoease.com/css-z-index-property-and-layering-tree/
        
        还有一种跟定位相关的，是浮动。float。脱离文档流，但是float本身，是有关系的。
    




## 3)
    
    了解base64图片

    可以使用工具生成，一般来说base64,比图片嗨大一些。
    http://tool.css-js.com/base64.html

    css-sprite 雪碧图可以减少HTTP请求，嗯。整体上来说，图片大小也变小了。




## 4)选择器
    
    E，F     多元素选择器
    E F     后代选择器，（F是E的后代，只要存在就行）
    E>F     子选择器    (必须是儿子节点)
    E＋F     毗邻选择器  (同一级 挨着 下一个元素 才有效果)
    E～F     同级选择器  (匹配在E元素之后的同级选择器,所以的，可以中间间断)




    伪类选择器 与 伪元素选择器

    伪类选择器是CSS中已经定义好的选择器，不能单独取名。
    常用的伪劣选择器是用在a元素上的几种。目前只有a可以用。
    将一个标签分为几种状态。
    如：a:link|a:visited|a:hover|a:active.

    而伪元素选择器并不是针对真正元素使用的元素选择器。css中有四种伪类选择
    (first-line:第一行, 
    first-letter：第一个字母,
    before：之前加入，
    after：
    ）
    css3中引入的机构性伪劣选择器的共同特征是允许开发者根据文档树中的结构
    来指定元素样式。

    结构性伪元素
    （1）root 文档的根，也就是html的最顶层。html
    （2）not 想对某个结构元素使用样式，但想排除这个字结构下面的字结构元素，就是用not样式。
    （3）empty 指定当元素内容空白时使用的样式。
    （4）target 对页面某个target元素制定样式，该样式在用户点击了页面中的链接，
    并且跳转到target元素后生效。解释一下target这个，就是指定到达目标的元素。就是到达目标中锚点包含的元素。
    (5)first-child 对一个父元素中的第一个子元素指定样式
    (6)last－child 对一个父元素中的最后一个子元素指定样式
    (7)nth-child指定序号的子元素样式设定（正数）
    (8)nth－last－child 指定子元素样式设定（倒数）
    odd 偶数， even 单数

        厂商前缀，
            －ms －webkit －o －moz 









