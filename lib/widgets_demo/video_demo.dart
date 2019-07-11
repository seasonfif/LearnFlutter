import 'dart:async';

import 'package:flutter/material.dart';
import 'package:learn_flutter/platform_service/log_util.dart';
import 'package:learn_flutter/widgets_demo/video_widget.dart';
import 'package:video_player/video_player.dart';

class VideoDemo extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("VideoDemo"),
      ),
      body: VideoWidget(),
    );
  }
}

class VideoDemoState extends State{

  VideoPlayerController _videoPlayerController;

  final String url = 'https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4';

  bool initialized = false;
  bool playing = false;
  bool seeking = false;
  bool finished = false;
  bool hasError = false;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(url);
    _videoPlayerController
      ..addListener((){
        LogUtil.d("_videoPlayerController.value=${_videoPlayerController.value}");
        hasError = _videoPlayerController.value.hasError;
        if(_videoPlayerController.value.position == _videoPlayerController.value.duration){
          //播放完毕了
          finished = true;
          playing = false;
        }
        setState(() {

        });
      })
      ..initialize().then((_){
        initialized = _videoPlayerController.value.initialized;
        _videoPlayerController.play();
        playing = true;
        LogUtil.e("_videoPlayerController.value=${_videoPlayerController.value}");
        setState(() {

        });
    });
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("VideoDemo"),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    Widget child;
    if(initialized){
      child = _buildPlayWidget();
    }else{
      if(hasError){
        child = _buildErrorWidget();
      }else{
        child = _buildInitWidget();
      }
    }

    return Container(
      child: Center(
        child: child,
      ),
    );
  }

  Widget _buildPlayWidget() {
    return GestureDetector(
      onTap: (){

        if(finished){
          finished = false;
          seeking = true;
          Future.delayed(Duration(milliseconds: 1000), (){
            _videoPlayerController.seekTo(Duration());
            setState(() {
              playing = true;
              seeking = false;
            });
          });
        }else{
          if(playing){
            _videoPlayerController.pause();
            playing = false;
          }else{
            _videoPlayerController.play();
            playing = true;
          }
        }
        setState(() {

        });
      },

      child: Container(
        child: AspectRatio(
          aspectRatio: _videoPlayerController.value.aspectRatio,
          child: Stack(
            children: <Widget>[
              VideoPlayer(_videoPlayerController),
              Center(
                child: _buildVideoControllerWidget()
              )
            ],
          )
        ),
      ),
    );
  }

  Widget _buildVideoControllerWidget() {
    Widget child;
    if(finished){
      child = Icon(
        Icons.refresh,
        color: Colors.blueAccent,
        size: 65,
      );
    }else{
      if(playing){
        child = Container();
      }else{
        if(seeking){
          child = CircularProgressIndicator();
        }else{
          child = Icon(
            Icons.play_arrow,
            color: Colors.blueAccent,
            size: 75,
          );
        }
      }
    }
    return child;
  }

  Widget _buildInitWidget() {
    return CircularProgressIndicator();
  }

  Widget _buildErrorWidget() {
    return AspectRatio(
      aspectRatio: _videoPlayerController.value.aspectRatio,
      child: Icon(
        Icons.error_outline,
        color: Colors.blueAccent,
        size: 45,
      ),
    );
  }
}