import 'package:http/http.dart' as http;

import 'package:learn_flutter/short_video/video_model.dart';

//
// Created by seasonfif
// 2019-07-07.

class HttpController {

  static void fetchVideo(int page, Function(List<ShortVideo>) callback) async{
    try{
      http.Response response = await http.get("http://gank.io/api/data/福利/5/$page");
      List<ShortVideo> videoList = VideoModel.fromJson(response.body).results;
      if(callback != null){
        callback(videoList);
      }
    }catch(e){
      print(e.toString());
    }
  }
}