## 

### 安装
    
    bower install react
    


### React 使用注意

        1） React 的 JSX 里约定分别使用首字母大、小写来区分本地组件的类和 HTML 标签。
        2） 组件 render返回的时候，如果多个组件，需要外层包裹div；
        3） 组件 反斜杠，需要闭合。
        4） 如果需要在手机或平板等触摸设备上使用 React，需要调用 React.initializeTouchEvents(true); 启用触摸事件处理
        5) 使用样式类的时候，使用 className='class'


        使用JS语法的时候：

            加个 —— {}
            注释也是一样 {/**/}
            注意实体转化成Unicode编码
            自定义HTML属性，使用 data-




### 组件是一个状态机
    
        setState(data, callback) 更新数据，然后，react会自动渲染。

        尝试把尽可能多的组件无状态化

        就是一个有状态的组件，包裹着一些无状态的组件，有状态的组件负责获取和更新数据，无状态的组件，用于渲染。

        State 应该包括那些可能被组件的事件处理器改变并触发用户界面更新的数据。就是说，用户操作，会影响数据更新，
    将这些需要更新的数据，放入state中，等待用户操作。



### 状态 state
    

        getInitialState 初始化组件的变量

            this.state.value            获取
            this.setState({a:A, b:B})   设定



### props
    
        props的传递大致是从顶向下,从父组件传递数据到子组件里面。
        
            父组件通过，props向下传递数据。子组件通过props拿到父组件提供的数据。
    
            var title = "ie";
            <MessageBox title={title} />;

                组件通过
                        this.props.title使用数据或者函数。
                可以在 getDefaultProps : function () {
                    title : 'alert',
                } 
        设定默认的数据，如果没有传入数据，就是用默认提供的，传入，使用传入的。




### event 

        {
            handleClick : function (e) {
                
                console.log(e);     
                    //  事件对象
                

                e.target            
                    // <p class="hg" data-reactid=".0.2"> 点击我 </p>


                e.nativeEvent   原生的。不是跨浏览器的。    
                    // MouseEvent {isTrusted: true, screenX: 111, screenY: 243, clientX: 50, clientY: 125…}
            }
        }

        <p className='hg' onClick={this.handleClick}> 点击我 </p>

    
        在标签中不使用 defaultValue。而是使用value＝{this.state.value},内容将无法修改。
        因此，需要添加onchange事件，进行监听改变/



### refs
    
        在标签中设定 ref='something...'，通过this.refs获取所有的ref。
    可以在拿到的时候，使用 this.refs['something...']获取到该react的对象，
    这个时候，就可以使用value获取里面的值。或者属性。

    this.refs['something...'] 是react 的 component

    使用 this.refs['something...'].getDomNode(); 获取DOM对象。

        1） this.refs['text1'].getDOMNode() 用这个对象去操作DOM的属性和内容，
        2） React.findDOMNode(this.refs['text1']) 这个方法也可获取真实node。
    
        在使用radiobutton 和 checkbox的时候，定义很多个refs有些不值得，因此还是
    增加点击事件的方式，获取值比较方便。

    ref也可以是一个函数。
        ref={function (comp) {  // comp是一个组件的react对象


        }}




### 复合组件

        通过使用哪些定义良好的组件，就是将组件变成函数使用。
    比较好维护，进行组件分级管理。

        从属关系，父子关系简单说就是DOM标签的关系。

        子级：
    






























































