var test = React.createElement('div', {className: 'navigation'}, 'Hello World!');
React.render(test, document.getElementById('hg'));



// 第一个例子
// class HelloWorld extends React.Component {
//   render() {
//     return (
//       <h1>hello world</h1>
//     );
//   }
// }

// React.render(
//   <HelloWorld />,
//   document.getElementById('hg')
// );
// --------------------------------------------------

// 第二个例子
// class Count extends React.Component {
//   constructor() {
//     this.state = {
//       count:0
//     }
//   }

//   update() {
//     this.setState({
//       count: ++this.state.count
//     });
//   }
//   render() {


//     return (
//       <div>
//         <h1>hello world</h1>
//         <h3>{this.state.count}</h3>
//       </div>
//     );
//   }
// }

// count = React.render(
//   <Count />,
//   document.getElementById('hg')
// );
//
// --------------------------------------------------
//
//  第三个例子
// class CommentList extends React.Component {
//   render() {
//     // 使用迭代的时候，都适用一个唯一的key
//     var commonNode = this.props.commons.map(function (common, index) {
//       return <Comment key={'common-'+index} author={common.author}>{common.body}</Comment>
//     });

//     return (
//       <div>
//        {commonNode}
//       </div>
//     );
//   }
// }

// class Comment extends React.Component {
//   render() {
//     return (
//       <div>
//         <div className="common-list">
//           {this.props.children}
//         </div>
//         <div className='common-list'>
//           {this.props.author}
//         </div>
//       </div>
//     );
//   }
// }

// var commons = [
//   {author:'hg', body:'this is a bad girl'},
//   {author:'hg', body:'this is a bad girl'},
// ];

// class CommonBox extends React.Component {
//   render() {
//     return (
//       <div className='commonBox'>
//         <h1>CommonBox</h1>
//         <CommentList commons={commons} ></CommentList>
//       </div>
//     );
//   }
// }

// CommonBox = React.render(
//   <CommonBox />,
//   document.getElementById('hg')
// );
