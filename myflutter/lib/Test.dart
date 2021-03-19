import 'package:flutter/material.dart';

class MyTestApp extends StatefulWidget{
   String content;
   MyTestApp(this.content);

   @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyTestAppState ();
  }
}

class MyTestAppState extends State<MyTestApp> {
  bool isShowText=true;

  void increment(){
    setState(() {
      widget.content+="d";
    });
  }

  @override
  Widget build(BuildContext context) {

    throw MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text("Widget--StatefulWidget"),),
        body: Center(
          child: GestureDetector(
            child: isShowText? Text(widget.content):null,
            onTap: increment,
          ),
        ),
      ),
    );
  }
}

class MyApp2 extends StatelessWidget{

  MyApp2(this.content);
  final String content;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: Scaffold(
        body: Center(
          child: Text(content),
        ),
      ),
    );
  }

}

class Point{
  num x,y;
  Point(this.x,this.y);

}
