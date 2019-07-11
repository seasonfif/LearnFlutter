import 'dart:async';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:learn_flutter/platform_service/log_util.dart';
import 'package:video_player/video_player.dart';

class VideoPageDemo extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => VideoPageDemoState();
}

class VideoPageDemoState extends State<VideoPageDemo> {

  PageController pageController = PageController();

  List videos = [
    'https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4',
  ];

  @override
  void initState() {
    super.initState();
    LogUtil.e("VideoPageDemo->initState");
    pageController.addListener(() {
      debugPrint("pageController.offset=${pageController.offset}");
    });
    _loadMore();
  }

  void _loadMore() async{

    Future.delayed(Duration(seconds: 13), (){
      videos.add('https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4');
      videos.add('https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4');
      videos.add('https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4');
      videos.add('https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4');
      videos.add('https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4');
      videos.add('https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4');
      videos.add('https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4');
      videos.add('https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4');
      videos.add('https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4');
      videos.add('https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4');
      setState(() {
        LogUtil.e("后台加载数据成功:${videos.length}");
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    LogUtil.d("VideoPageDemo->build");
    return Scaffold(
        appBar: AppBar(
          title: Text("VideoPageDemo"),
        ),
        body: _buildVideoPage());
  }

  Widget _buildVideoPage() {
    return PageView.builder(
      scrollDirection: Axis.vertical,
      controller: pageController,
      itemCount: videos.length,
      itemBuilder: (context, index) {
        return VideoItem(videos[index]);
      },);
  }
}


class VideoItem extends StatefulWidget{

  final String url;

  VideoItem(this.url);


  @override
  State<StatefulWidget> createState() => VideoItemState();
}

class VideoItemState extends State<VideoItem>{

  VideoPlayerController _videoPlayerController;
  ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(widget.url);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 9 / 16,
      autoPlay: true,
      looping: true,
      // Try playing around with some of these other options:

      // showControls: false,
      // materialProgressColors: ChewieProgressColors(
      //   playedColor: Colors.red,
      //   handleColor: Colors.blue,
      //   backgroundColor: Colors.grey,
      //   bufferedColor: Colors.lightGreen,
      // ),
      // placeholder: Container(
      //   color: Colors.grey,
      // ),
      // autoInitialize: true,
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      color: Colors.grey[300],
      child: Center(
        child: Chewie(
          controller: _chewieController,
        ),
      ),
    );
  }
}