import 'dart:io';

import 'package:http/http.dart' as Http;
import 'package:flutter/material.dart';

//
// Created by seasonfif
// 2018/11/19.

class AsyncDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AsyncDemoContent();
  }
}

class AsyncDemoContent extends State<AsyncDemo>{

  var msg;

  _fetchAsync() async{
    var client = HttpClient();
    var request = await client.getUrl(Uri.parse("http://www.baidu.com"));
    Future.delayed(Duration(seconds: 3), (){
      var future = request.close();
      future.then((response){
        setState(() {
          print('Response=${response.connectionInfo.remoteAddress}');
          msg = "${response.connectionInfo.remoteAddress}";
        });
      });
    });
  }

  var httpclient = Http.Client();//获取http对象
  var url="http://www.wanandroid.com/project/list/1/json?cid=1";
  _postData() {
    httpclient.get(url).then((response){
      print('Response=${response.body}');
    });
  }

  @override
  void initState() {
    super.initState();
//    _fetchAsync();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AsyncDemo"),
      ),
      floatingActionButton: FloatingActionButton(
          child:Icon(Icons.flight),
          onPressed: _postData),
      body: _buildBody(msg, _fetchAsync()),
    );
  }
}

_buildBody(msg, getData) {

  if(msg == null){
    return Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.red,
        strokeWidth: 2.0,
      ),
    );
  } else{
    return Center(

      child: Column(

        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(msg),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(msg),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(msg),
          ),
          FlatButton(
              onPressed: (){
                getData();
              },
              child: Text("async")),
        ],
      ),
    );
  }
}