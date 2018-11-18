
import 'package:flutter/material.dart';

class CardDemo extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CardDemo"),
      ),
      body: CardContent(),
    );
  }
}

class CardContent extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return _buildCard();
  }
}

Widget _buildCard() {
  return SizedBox(
    height: 256.0,
    child: Card(
      elevation: 5.0,
      child: Column(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.phone),
            title: Text("11122233355"),
            subtitle: Text("(010)", style: TextStyle(color: Colors.black38),),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text("11122233355"),
            subtitle: Text("(010)", style: TextStyle(color: Colors.black38),),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text("11122233355"),
            subtitle: Text("(010)", style: TextStyle(color: Colors.black38),),
          ),
        ],
      ),
    ),
  );
}
