import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget{

  final int initValue;

  const CounterWidget({Key key,this.initValue:0});



  @override
  _CounterWidgetState createState() => new _CounterWidgetState();

}

class _CounterWidgetState extends State<CounterWidget>{

  int _counter;

  @override
  void initState() {
    super.initState();
    //初始化状态
    _counter=widget.initValue;
    print("initState");
  }


  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
//      body: Center(
////        child: FlatButton(
////          child: Text('$_counter'),
////          onPressed: ()=>setState((()=>++_counter)),
////        ),
////      ),
      appBar: AppBar(
        title: Text("子树中获取State对象"),
      ),
      body: Center(
        child: Builder(builder: (context) {
          return RaisedButton(
            onPressed: () {
              // 查找父级最近的Scaffold对应的ScaffoldState对象
              ScaffoldState _state = context.ancestorStateOfType(
                  TypeMatcher<ScaffoldState>());
              //调用ScaffoldState的showSnackBar来弹出SnackBar
              _state.showSnackBar(
                SnackBar(
                  content: Text("我是SnackBar"),
                ),
              );
            },
            child: Text("显示SnackBar"),
          );
        }),
      ),
    );
  }

  @override
  void didUpdateWidget(CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactivate");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("reassemble");
  }
}