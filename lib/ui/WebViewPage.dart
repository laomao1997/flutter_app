import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class WebViewPage extends StatefulWidget {

  @override
  _WebViewPageState createState() {
    return new _WebViewPageState();
  }
}

class _WebViewPageState extends State<WebViewPage> {

  String _remoteArgs;
  var _url = "http://106.14.133.189:9090";

  _getSth() async {
    Dio dio = new Dio();
    Response response = await dio.get(_url);
    setState(() {
      _remoteArgs = response.data;
    });
    print(_remoteArgs);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("IP地址为：$_url"),
            Text("从服务器获得的数据为："),
            Text("$_remoteArgs"),
            RaisedButton(
              child: Text("发起请求"),
              onPressed: _getSth,
            )
          ],
        ),
      ),
    );
  }

}