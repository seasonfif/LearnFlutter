import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:learn_flutter/short_video/http_controller.dart';
import 'package:learn_flutter/short_video/video_model.dart';
import 'package:learn_flutter/short_video/video_page.dart';

//
// Created by seasonfif
// 2019-07-07.

class VideoFeed extends StatefulWidget {

  final BuildContext parent;

  const VideoFeed({Key key, this.parent}) : super(key: key);

  @override
  State<StatefulWidget> createState() => VideoFeedState(parent);

}

class VideoFeedState extends State<VideoFeed> with AutomaticKeepAliveClientMixin{

  final BuildContext parent;

  var _futureBuilderFuture;

  List<ShortVideo> videos;

  int pageNum = 1;

  ScrollController _scrollController = ScrollController();

  VideoFeedState(this.parent);

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    _futureBuilderFuture = _getDataWhenEnter();

    _scrollController.addListener((){
      if(_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent){
        debugPrint("滑动到底部");
        _loadMore();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "ShortVideo",
          ),
        ),
        body: FutureBuilder(
          future:_futureBuilderFuture,
          builder: _buildFuture,
        ),
      ),
    );
  }

  Widget _buildFuture(BuildContext context, AsyncSnapshot snapshot) {
    Widget childWidget;
    switch (snapshot.connectionState){

      case ConnectionState.none:
        childWidget = Text("等待连接网络");
        break;
      case ConnectionState.waiting:
        childWidget = CircularProgressIndicator();
        break;
      case ConnectionState.active:
        childWidget = Text("开始读取数据");
        break;
      case ConnectionState.done:
        if(videos == null || videos.length <1){
          debugPrint("第一次加载");
          String json = snapshot.data;
          videos = VideoModel.fromJson(json).results;
        }
        debugPrint("item数量：${videos.length}");
        childWidget = _buildListContent();
        break;
    }
    return Center(
      child: childWidget,
    );
  }

  Widget _buildListContent() {

    return RefreshIndicator(
      onRefresh: _refreshData,
      child: _buildList(),
    );
  }

  Widget _buildList(){
    return ListView.builder(
        itemCount: videos.length,
        controller: _scrollController,
        itemBuilder: (context, index){
          ShortVideo shortVideo = videos[index];
          return GestureDetector(
            onTap: (){
              Navigator.push(parent, MaterialPageRoute(
                  builder: (context){
                    return VideoPage(shortVideo);
                  }));
            },
            onLongPress: null,
            child: Container(
              constraints: BoxConstraints.expand(height: 250.0),
              child: Stack(
                children: <Widget>[
                  SizedBox.expand(
                    child: CachedNetworkImage(
                      imageUrl: videos[index].url,
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  Future _getDataWhenEnter() async{
    http.Response response;
    /*response = await Future.delayed(Duration(seconds: 3), (){
      return http.get("http://gank.io/api/data/福利/5/$pageNum");
    });*/
    response = await http.get("http://gank.io/api/data/福利/5/$pageNum");
    return response.body;
  }

  Future<void> _refreshData() async{
    pageNum = 1;
    HttpController.fetchVideo(pageNum, (list){
      setState(() {
        videos = list;
      });
    });
  }

  void _loadMore(){
    pageNum ++;
    HttpController.fetchVideo(pageNum, (list){
      setState(() {
        videos.addAll(list);
      });
    });
  }
}