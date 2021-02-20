import 'package:flutter/material.dart';
import 'ioswidget.dart';
import 'mylayout.dart';
import 'lifecontrol.dart';
import 'routecontrol.dart';
import 'apphome.dart';

// void main() {
//   runApp(MyApp());
// //  runApp(RouterTestRoute());
// }

void main() => runApp(MyApp());

bool say(String msg,String from,int clock){
  print(msg+"from" +from+"at"+clock?.toString());
  return true;
}

bool say2(String msg,{String from,int clock}){
  print(msg+"from" +from+"at"+clock?.toString());
  return true;
}

bool say3(String msg,{@required String from,int clock}){
  print(msg+"from" +from+"at"+clock?.toString());
  return true;
}

bool say4(String msg,[String from,int clock]){
  print(msg+"from" +from+"at"+clock?.toString());
  return true;
}

bool say5(String msg,{String from="empty",int clock=0}){
  print(msg+"from" +from+"at"+clock?.toString());
  return true;
}







class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //注册路由表
      routes: {
        "new_page":(context)=>NewRoute(),
        "tip":(context){
          return TipRoute(text: ModalRoute.of(context).settings.arguments);
        },
        "counter":(context)=>CounterWidget(),
        "my_layout":(context)=>MyWrap(),
        "my_apphome":(context)=>MyHomePage(),
         // 省略其它路由注册信息
        "/":(context)=>ScaffoldRoute(), //注册首页路由
      },
      onGenerateRoute: (RouteSettings settings){
        return MaterialPageRoute(builder: (context){
          //注意，onGenerateRoute只会对命名路由生效。
            String routerName=settings.name;


            print(say is Function);


            say("msg", "from", 1);
          // 如果访问的路由页需要登录，但当前未登录，则直接返回登录页路由，
          // 引导用户登录；其它情况则正常打开路由。
          return null;
        });
      },
//      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}









