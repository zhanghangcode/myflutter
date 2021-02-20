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

class Point{
  num x,y;
  Point(this.x,this.y);

}
