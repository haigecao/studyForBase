## 
    (1)npm init  //初始化
    (2)npm install --save browser-sync   // 安装browsersync

    (3) 修改package内的script变量。
    "scripts": {
      "dev": "browser-sync start --server --files *.*"  // 观察项目内的所有文件
    },

    (4)npm run dev  启动 browsersync 进行同步更新。
    也可使用：browser-sync start --server --files "*.*"
    因为已经安装过全局的borsersync的插件了。

－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－

## 学习react需要引入前置文件，可以在cdnjs.com内去查找。

###  第一个例子 html文件
    <!DOCTYPE html>
    <html>
      <head>
        <meta charset="utf-8">
        <title>react test one</title>
        <script src="build/react.js"></script>
        <script src="build/JSXTransformer.js"></script>
        <script type="text/jsx;harmony=true" src='app.jsx'></script>  // 这个harmony=true是es6格式
      </head>
      <body>
        <div id='hg'></div>
      </body>
    </html>

    app.jsx文件
    class HelloWorld extends React.Component {
      render() {
        return (
          <h1>hello world</h1>
        );
      }
    }

    React.render(
      <HelloWorld />,
      document.getElementById('hg')
    );
－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－－

###  第二个例子
    react 尤其只能拥有一个父级元素
    如果render方法内return返回必须是一个元素。
      例如 ：
          <div>
              <h1>hello world</h1>
              <h3>{this.state.count}</h3>
          </div>
  如果没写div标签，只返回2个元素，那么就会报错。
  react 之渲染哪些改变的dom节点.

  class Count extends React.Component {
    constructor() {
      this.state = {
        count:0
      }
    }

    update() {
      this.setState({
        count: ++this.state.count
      });
    }
    render() {


      return (
        <div>
          <h1>hello world</h1>
          <h3>{this.state.count}</h3>
        </div>
      );
    }
  }

count = React.render(
  <Count />,
  document.getElementById('hg')
);

在控制台中输入 count.updata()
就可以看到web browser上面的数字更新。


### 第三个例子————组件嵌套，
  在CommonBox中嵌套了        
        <CommonForm />
        <CommonList /> 两个组件


    class CommonList extends React.Component {
      render() {
        return (
          <div className="common-list">classommonList</div>
        );
      }
    }

    class CommonForm extends React.Component {
      render() {
        return (
          <div className="common-form">CommonForm</div>
        );
      }
    }


    class CommonBox extends React.Component {
      render() {
        return (
          <div className='commonBox'>
            <h1>CommonBox 1</h1>
            <CommonForm />
            <CommonList />
          </div>
        );
      }
    }

    CommonBox = React.render(
      <CommonBox />,
      document.getElementById('hg')；
    );


### 第四个例子 react中的属性，可以通过this.props 获取
    class Comment extends React.Component {
      render() {
        return (
          <div>
            <div className="common-list">
              {this.props.children}
            </div>
            <div className='common-list'>
              {this.props.author}
            </div>
          </div>
        );
      }
    }

    class CommonBox extends React.Component {
      render() {
        return (
          <div className='commonBox'>
            <h1>CommonBox</h1>
            <Comment author='wjonlyhg'>
              this is a big boy!          
            </Comment>
          </div>
        );
      }
    }

    CommonBox = React.render(
      <CommonBox />,
      document.getElementById('hg')
    );

    在注意一下，组件名大写，还有就是return返回值包含2个以上，就必须包裹在一个标签中。
    这里实现的是硬编码状态的显示，不能动态改变。




### 第五个例子
    class CommentList extends React.Component {
      render() {
        // 使用迭代的时候，都适用一个唯一的key
        var commonNode = this.props.commons.map(function (common, index) {
          return <Comment key={'common-'+index} author={common.author}>{common.body}</Comment>
        });

        return (
          <div>
           {commonNode}
          </div>
        );
      }
    }

    class Comment extends React.Component {
      render() {
        return (
          <div>
            <div className="common-list">
              {this.props.children}
            </div>
            <div className='common-list'>
              {this.props.author}
            </div>
          </div>
        );
      }
    }

    var commons = [
      {author:'hg', body:'this is a bad girl'},
      {author:'hg', body:'this is a bad girl'}
    ];

    class CommonBox extends React.Component {
      render() {
        return (
          <div className='commonBox'>
            <h1>CommonBox</h1>
            <CommentList commons={commons} ></CommentList>
          </div>
        );
      }
    }

    CommonBox = React.render(
      <CommonBox />,
      document.getElementById('hg')
    );




