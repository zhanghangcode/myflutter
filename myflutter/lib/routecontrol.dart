import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'ioswidget.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many ',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            FlatButton(
              child: Text("open new route"),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.pushNamed(context, "new_page");
//                //导航到新路由 CounterWidget
//                Navigator.push(context,
//                    MaterialPageRoute(builder: (context){
////                      return NewRoute();
//                      return RouterTestRoute();
//                    }));
              },
            ),
            FlatButton(
              child: Text("open counter route"),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.pushNamed(context, "counter");
              },
            ),
            FlatButton(
              child: Text("open Mylayout route"),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.pushNamed(context, "my_layout");
              },
            ),
            FlatButton(
              child: Text("open ios route"),
              textColor: Colors.blue,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context){
                      return CupertinoTestRoute();
                    }
                ));
              },
            ),
            RandomWordsWidget(),
            Echo(text: "hello world"),
            Text("Hello world",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18.0,
                    height: 1.2,
                    fontFamily: "Courier",
                    background: new Paint()..color=Colors.yellow,
                    decoration:TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.dashed
                )
            ),
            DecoratedBox(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors:[Colors.red,Colors.orange[700]]), //背景渐变
                    borderRadius: BorderRadius.circular(3.0), //3像素圆角
                    boxShadow: [ //阴影
                      BoxShadow(
                          color:Colors.black54,
                          offset: Offset(2.0,2.0),
                          blurRadius: 4.0
                      )
                    ]
                ),
                child: Padding(padding: EdgeInsets.symmetric(horizontal: 80.0, vertical: 18.0),
                  child: Text("Login", style: TextStyle(color: Colors.white),),
                )
            ),
          ],
        ),


      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


class TipRoute extends StatelessWidget{
  TipRoute({Key key,@required this.text}):super(key:key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("提示"),
      ),
      body: Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            children: <Widget>[
              Text(text),
              RaisedButton(
                onPressed:()=>Navigator.pop(context,"我是提示:路由参数ID520") ,
                child: Text("返回"),

              )

            ],
          ),
        ),
      ),
    );
  }

}

class RouterTestRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        onPressed: ()async{
          // 打开`TipRoute`，并等待返回结果
          var result= await Navigator.push(context, MaterialPageRoute(
              builder: (context){
                return TipRoute(
                  // 路由参数
                  text: "我是提示:路由参数ID521",
                );
              }
          )
          );
          //输出`TipRoute`路由返回结果
          print("路由返回值: $result");
        },
        child: Text("打开提示页"),
      ),

    );
  }

}
class RandomWordsWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    //生成随机字符串
    final wordPair=new WordPair.random();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Text(wordPair.toString()),
    );
  }
}

class Echo extends StatelessWidget{
  final String text;
  final Color backgroundColor;
  const Echo({
    Key key,
    @required this.text,
    this.backgroundColor:Colors.grey,
  }):super(key:key);
  @override
  Widget build(BuildContext context) {

    return Center(
      child: Container(
        color: backgroundColor,
        child: Text(text),
      ),
    );
  }
}
