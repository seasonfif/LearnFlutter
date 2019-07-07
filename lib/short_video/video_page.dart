import 'dart:async';

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:learn_flutter/short_video/http_controller.dart';
import 'package:learn_flutter/short_video/video_model.dart';

class VideoPageState extends State<VideoPage>{

  List<ShortVideo> videos = List();

  int pageNum = 1;

  ShortVideo video;

  PageController _pageController = PageController(viewportFraction: 1);

  VideoPageState(this.video){
    videos.add(video);
    HttpController.fetchVideo(pageNum, (list){
      setState(() {
        videos.addAll(list);
      });
    });
  }


  @override
  void initState() {
    super.initState();
    _pageController.addListener((){
      if(_pageController.position.pixels ==
          _pageController.position.maxScrollExtent){
//        _loadMore();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    debugPrint("build");

    return MaterialApp(

      debugShowCheckedModeBanner: false,

      home: RefreshIndicator(
        onRefresh: _onRefresh,
        child: PageView.builder(
          physics: CustomPhysics(),
          scrollDirection: Axis.vertical,
          onPageChanged: (index){
            debugPrint("当前页面：$index");
          },
          itemCount: videos.length,
          controller: _pageController,
          itemBuilder: _buildItem,
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index) {

    ShortVideo shortVideo = videos[index];

    return Stack(
      children: <Widget>[
        SizedBox.expand(
          child: CachedNetworkImage(
            imageUrl: shortVideo.url,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 20.0,
          left: 20.0,
          child: Text(
            shortVideo.who,
            style: TextStyle(
              color: Colors.deepOrangeAccent,
              fontSize: 30.0
            ),
          ),
        )
      ],
    );
  }

  Future<void> _onRefresh() async{
    debugPrint("下拉刷新");
    pageNum = 1;
    HttpController.fetchVideo(pageNum, (list){
      setState(() {
        videos = list;
      });
    });
  }

  void _loadMore(){
    debugPrint("加载更多");
    pageNum++;
    HttpController.fetchVideo(pageNum, (list){
      setState(() {
        videos.addAll(list);
      });
    });
  }
}

class VideoPage extends StatefulWidget{

  final ShortVideo video;

  const VideoPage(this.video, {Key key}) :super(key: key);

  @override
  State<StatefulWidget> createState() => VideoPageState(video);

}

class CustomPhysics extends ClampingScrollPhysics{

  @override
  // TODO: implement minFlingDistance
  double get minFlingDistance => 300.0;

  @override
  // TODO: implement dragStartDistanceMotionThreshold
  double get dragStartDistanceMotionThreshold => 300.0;

}