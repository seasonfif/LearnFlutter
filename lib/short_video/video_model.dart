import 'dart:convert';

//
// Created by seasonfif
// 2019-07-07.

class VideoModel{
  bool error;
  List<ShortVideo> results;

  VideoModel({this.error, this.results});

  VideoModel.fromJson(String jsonStr){
    Map<String, dynamic> json = jsonDecode(jsonStr);
    error = json['error'];
    if (json['results'] != null) {
      results = new List<ShortVideo>();
      json['results'].forEach((v) {
        results.add(new ShortVideo.fromJson(v));
      });
    }
  }

  VideoModel.fromMap(Map<String, dynamic> json) {
    error = json['error'];
    if (json['results'] != null) {
      results = new List<ShortVideo>();
      json['results'].forEach((v) {
        results.add(new ShortVideo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['error'] = this.error;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ShortVideo {
  String sId;
  String createdAt;
  String desc;
  String publishedAt;
  String source;
  String type;
  String url;
  bool used;
  String who;

  ShortVideo(
      {this.sId,
        this.createdAt,
        this.desc,
        this.publishedAt,
        this.source,
        this.type,
        this.url,
        this.used,
        this.who});

  ShortVideo.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    createdAt = json['createdAt'];
    desc = json['desc'];
    publishedAt = json['publishedAt'];
    source = json['source'];
    type = json['type'];
    url = json['url'];
    used = json['used'];
    who = json['who'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['desc'] = this.desc;
    data['publishedAt'] = this.publishedAt;
    data['source'] = this.source;
    data['type'] = this.type;
    data['url'] = this.url;
    data['used'] = this.used;
    data['who'] = this.who;
    return data;
  }
}