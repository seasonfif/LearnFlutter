import 'package:flutter/material.dart';

import 'pet_card_model.dart';

class PetCard extends StatefulWidget{

  final PetCardModel model;

  const PetCard({Key key, this.model}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PetCardState();
}

class PetCardState extends State<PetCard>{

  PetCardModel data;

  @override
  void initState() {
    super.initState();
    data = widget.model;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /*return ListView(
      children: <Widget>[
        buildCard(),
      ],
    );*/

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[

        buildCard(),
      ],
    );
  }

  Widget buildCard(){
    return Container(
      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
              blurRadius: 6,
              spreadRadius: 4,
              color: Color.fromARGB(20, 0, 0, 0)
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          renderCover(),
          renderUserInfo(),
          renderPublishInfo(),
          renderActionInfo()
        ],
      ),
    );
  }

  Widget renderCover(){
    return Stack(
      fit: StackFit.passthrough,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
          child: Image.network(
//            "https://ws1.sinaimg.cn/large/0065oQSqgy1fwyf0wr8hhj30ie0nhq6p.jpg",
            "https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1402367109,4157195964&fm=27&gp=0.jpg",
            height: 160,
            fit: BoxFit.fitWidth,
          ),
        ),
        Positioned.fromRect(
            rect: Rect.fromLTRB(0, 100, 0, 0),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(0, 0, 0, 0),
                      Color.fromARGB(80, 0, 0, 0),
                    ])
              ),
            ))
      ],
    );
  }

  Widget renderUserInfo(){

    return Container(
      margin: EdgeInsets.only(top: 16),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 20,
                  backgroundColor: Color(0xFFCCCCCC),
                  backgroundImage: NetworkImage("https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1402367109,4157195964&fm=27&gp=0.jpg"),
                ),
                Padding(padding: EdgeInsets.only(right: 8),),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "大米要煮小米粥我们可以实践Container组件设置不同的borderRadius",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF333333),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 3),),
                    Text(
                      "小米|我家的小仓鼠",
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF999999),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            width: 50,
            color: Colors.blue,
            child: Text(
              "15:20",
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey
              ),
            ),
          ),
        ],
      ),

    );
  }

  Widget renderPublishInfo(){
    return Container(
      margin: EdgeInsets.only(top: 16),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 14),
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: Color(0xFFFFC600),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(8),
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              )
            ),
            child: Text(
              '# 萌宠小屋',
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ),
          Text(
            "通过这块区域的UI练习，我们可以实践Container组件设置不同的borderRadius，以及Text组件文本内容超出时的截断处理，Dom结构如下",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color(0xFF333333),
              ),
          ),
        ],
      ),
    );
  }

  Widget renderActionInfo(){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                Icons.message,
                size: 16,
                color: Color(0xFF999999),
              ),
              Padding(padding: EdgeInsets.only(left: 6)),
              Text(
                "356",
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF999999),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.favorite,
                size: 16,
                color: Color(0xFF999999),
              ),
              Padding(padding: EdgeInsets.only(left: 6)),
              Text(
                "258",
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF999999),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.share,
                size: 16,
                color: Color(0xFF999999),
              ),
              Padding(padding: EdgeInsets.only(left: 6)),
              Text(
                "126",
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xFF999999),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}