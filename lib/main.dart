import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app/SpClient.dart';
import 'package:flutter_app/model/Weather.dart';
import 'ui/LoginPage.dart';
import 'ui/WebViewPage.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 应用名称
      title: 'Flutter Demo',
      theme: ThemeData(
        // 蓝色主题
        primarySwatch: Colors.blue,
      ),
      // 注册路由表
      routes: {
        "new_page": (context) => LoginPage(),
      },
      // 应用路由主页
      home: MyHomePage(title: 'Flutter Demo 主页'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // MyHomePage 是应用的首页. It is stateful, meaning
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

  void getHttp() async {
    String args =
        "https://free-api.heweather.net/s6/weather/now?key=9b8e0d5e02244c0a9a6d22543afdc4a5&location=北京";
    try {
      Response response = await Dio().get(args);
      Weather weather = Weather.fromJson(response.data);
      print(weather.heWeather6[0].basic.cid);
      SpClient.sp.setString('cid', weather.heWeather6[0].basic.cid);
      print(SpClient.sp.get('cid'));
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
//    SvgPicture cakeRectangle =
//        new SvgPicture.asset("assets/images/cake_rectangle.svg");
//    final Widget cakeSvgIcon = new SvgPicture.asset("assets/images/cake_rectangle.svg");

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
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 50.0,
            height: 50.0,
            child: Image.asset("assets/images/cake_cup.png"),
          ),
//          SizedBox(
//            width: 50.0,
//            height: 50.0,
//            child: cakeSvgIcon,
//          ),
          RandomWordsWidget(),
          Text.rich(TextSpan(children: [
            TextSpan(text: "Home: "),
            TextSpan(
              text: "https://flutterchina.club",
              style: TextStyle(color: Colors.blue),
            ),
          ])),
          Row(
            // Column is also layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.

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
                '您已点击按钮',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.display1,
              ),
              Text('次'),
            ],
          ),
          FlatButton(
            child: Text("打开新页面"),
            textColor: Colors.blue,
            onPressed: () {
              Navigator.pushNamed(context, "new_page");
            },
          ),
          FlatButton(
            color: Colors.blue,
            child: Text("open echo route"),
            textColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            onPressed: () {
              Navigator.push(context, new MaterialPageRoute(builder: (context) {
                return new EchoRoute("$_counter");
              }));
            },
          ),
          RaisedButton(
            color: Colors.blue,
            child: Text("Submit"),
            highlightColor: Colors.blue[700],
            colorBrightness: Brightness.dark,
            textColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            onPressed: () {
              getHttp();
            },
          ),
          RaisedButton(
            color: Colors.blue,
            child: Text("打开请求页面"),
            highlightColor: Colors.blue[700],
            colorBrightness: Brightness.dark,
            textColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            onPressed: () {
              Navigator.push(context, new MaterialPageRoute(builder: (context) {
                return new WebViewPage();
              }));
            },
          ),
          SwitchAndCheckBoxTestRoute(),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class RandomWordsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Text(
        wordPair.toString() * 6,
        style: TextStyle(fontSize: 16.0),
      ),
    );
  }
}

class EchoRoute extends StatelessWidget {
  final String tip;

  EchoRoute(this.tip);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Echo route"),
      ),
      body: Center(
        child: Text(tip),
      ),
    );
  }
}

class SwitchAndCheckBoxTestRoute extends StatefulWidget {
  @override
  _SwitchAndCheckBoxTestRouteState createState() =>
      new _SwitchAndCheckBoxTestRouteState();
}

class _SwitchAndCheckBoxTestRouteState
    extends State<SwitchAndCheckBoxTestRoute> {
  bool _switchSelected = true; // 维护单选开关状态
  bool _checkboxSelected = true; // 维护复选框状态

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Switch(
          value: _switchSelected,
          onChanged: (value) {
            setState(() {
              _switchSelected = value;
            });
          },
        ),
        Checkbox(
          value: _checkboxSelected,
          onChanged: (value) {
            setState(() {
              _checkboxSelected = value;
            });
          },
        )
      ],
    );
  }
}
