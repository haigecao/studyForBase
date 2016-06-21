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
        
        1）手动传递





### 复合组件

        通过使用哪些定义良好的组件，就是将组件变成函数使用。
    比较好维护，进行组件分级管理。

        从属关系，父子关系简单说就是DOM标签的关系。

        子级：    
    






























































