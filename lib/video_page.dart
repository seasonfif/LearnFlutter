import 'dart:async';

import 'package:flutter/material.dart';

class VideoPageState extends State<VideoPage>{

  final BuildContext parent;

  PageController _pageController = PageController();

  List<Animal> animals = Animal.allAnimal();

  VideoPageState(this.parent);


  @override
  void initState() {
    super.initState();
    _pageController.addListener((){
      if(_pageController.position.pixels ==
          _pageController.position.maxScrollExtent){
        debugPrint("滑动到底部");
        _loadMore();
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
    return MaterialApp(

      debugShowCheckedModeBanner: false,

      home: RefreshIndicator(
        onRefresh: _onRefresh,
        child: PageView.builder(
          scrollDirection: Axis.vertical,
          onPageChanged: (index){
            debugPrint("当前页面：$index");
          },
          itemCount: animals.length,
          controller: _pageController,
          itemBuilder: _buildItem,
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index) {

    Animal animal = animals[index];

    return Stack(
      children: <Widget>[
        SizedBox.expand(
          child: Image.network(
            animal.image,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 20.0,
          left: 20.0,
          child: Text(
            animal.description,
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
    return Future.delayed(Duration(milliseconds: 1500), (){
      debugPrint("刷新成功");
      setState(() {
        animals = Animal.update(3);
      });
    }) ;
  }

  void _loadMore() async{
    debugPrint("加载更多");

    await Future.delayed(Duration(milliseconds: 1500), (){
      setState(() {
        animals.addAll(Animal.update(2));
      });
    });
  }
}

class VideoPage extends StatefulWidget{

  final BuildContext parent;

  const VideoPage({
    Key key,
    this.parent}) :
        super(key: key);

  @override
  State<StatefulWidget> createState() => VideoPageState(parent);

}

class Animal {
  final String name;

  final String image;

  final String description;

  Animal({this.name, this.image, this.description});

  static List<Animal> allAnimal() {
    var animal = List<Animal>();

    animal.add(Animal(
      name: "老虎",
      description: "老虎屁股摸不得！",
      image: "https://dwz.cn/ghiCDaUp",
    ));

    animal.add(Animal(
      name: "小狗",
      description: "小狗啃骨头",
      image: "https://dwz.cn/Isoze9KN",
    ));

    animal.add(Animal(
      name: "小猫",
      description: "小猫吃鱼",
      image: "https://dwz.cn/x4dNzR6r",
    ));

    animal.add(Animal(
      name: "老鼠",
      description: "老鼠会打洞",
      image: "https://dwz.cn/1WeGTFA5",
    ));

    animal.add(Animal(
      name: "小鸡",
      description: "小鸡本米尺",
      image: "https://dwz.cn/SXhBUBCP",
    ));
    return animal;
  }

  static List<Animal> update(int count) {
    var animals = List<Animal>();
    for(int i=0; i < count; i++){
      animals.add(Animal(
        name: "小猫",
        description: "小猫吃鱼$i",
        image: "https://dwz.cn/x4dNzR6r",
      ));
    }
    return animals;
  }
}