import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'ioswidget.dart';

void main() {
  runApp(MyApp());
//  runApp(RouterTestRoute());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //注册路由表
      routes: {
        "new_page":(context)=>NewRoute(),
        "tip":(context){
          return TipRoute(text: ModalRoute.of(context).settings.arguments);
        },
        "counter":(context)=>CounterWidget(),
         // 省略其它路由注册信息
        "/":(context)=>MyHomePage(title: 'Flutter Demo Home Page'), //注册首页路由
      },
      onGenerateRoute: (RouteSettings settings){
        return MaterialPageRoute(builder: (context){
          //注意，onGenerateRoute只会对命名路由生效。
            String routerName=settings.name;
          // 如果访问的路由页需要登录，但当前未登录，则直接返回登录页路由，
          // 引导用户登录；其它情况则正常打开路由。
          return null;
        });
      },
//      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
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
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
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
          ),
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

