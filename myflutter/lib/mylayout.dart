import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MyWrap extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
       appBar: AppBar(
       title: Text("MyLayout"),
       actions: <Widget>[
           UnconstrainedBox(
             child: SizedBox(
               width: 20,
               height: 20,
               child: CircularProgressIndicator(
                 strokeWidth: 3,
                 valueColor: AlwaysStoppedAnimation(Colors.white70),
               ),
             ),
           )
         ],
    ),
    body:Center(
        child: Wrap(
          spacing: 8.0, // 主轴(水平)方向间距
          runSpacing: 4.0, // 纵轴（垂直）方向间距
          alignment: WrapAlignment.center, //沿主轴方向居中
          children: <Widget>[
            new Chip(
              avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('A')),
              label: new Text('Hamilton'),
            ),
            new Chip(
              avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('M')),
              label: new Text('Lafayette'),
            ),
            new Chip(
              avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('H')),
              label: new Text('Mulligan'),
            ),
            new Chip(
              avatar: new CircleAvatar(backgroundColor: Colors.blue, child: Text('J')),
              label: new Text('Laurens'),
            ),
          ],
        ),
    )
   );
  }
  
}