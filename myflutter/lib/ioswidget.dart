import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoTestRoute  extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("Cupertino Demo"),
        ),
      child: Center(
        child: CupertinoButton(
          color: CupertinoColors.activeBlue,
          child: Text("Press"),
          onPressed: (){},
        ),
      ),
    );
  }
}

class TapBoxA extends StatefulWidget{

  TapBoxA({Key key}):super(key:key);

  @override
  _TapBoxAState createState() => new _TapBoxAState();


}

class _TapBoxAState extends State<TapBoxA>{

  bool _active=false;

  void _handleTap(){
    setState(() {
      _active=!_active;
    });
  }
  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            _active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32.0, color:Colors.blue),
          ),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }

}

class NewRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    var args=ModalRoute.of(context).settings.arguments;
    return Scaffold(
        appBar: AppBar(
          title: Text("NEW Route"),
        ),
        body:Center(
          child: Column(
            children: <Widget>[
              Text.rich(
                TextSpan(
                   children: [
                     TextSpan( text: "Home:  "),
                     TextSpan(text: "https://flutterchina.club",
                         style: TextStyle(
                             color: Colors.blue
                         ),
                         )
                   ]
                ),
              ),
              DefaultTextStyle(
                //1.设置文本默认样式
                style: TextStyle(
                  color:Colors.red,
                  fontSize: 20.0,
                ),
                textAlign: TextAlign.start,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("hello world"),
                    Text("I am Jack"),
                    Text("I am Jack",
                      style: TextStyle(
                          inherit: false, //2.不继承默认样式
                          color: Colors.grey
                      ),
                    ),
                  ],
                ),
              ),
              RaisedButton(
                child: Text("normal"),
                onPressed: () {},
              ),
              FlatButton(
                color: Colors.blue,
                highlightColor: Colors.blue[700],
                colorBrightness: Brightness.dark,
                splashColor: Colors.grey,
                child: Text("Submit"),
                shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                onPressed: () {},
              ),
            ],
          )

        )
    );
  }

}