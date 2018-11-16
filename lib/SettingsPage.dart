import 'package:flutter/material.dart';
import 'about.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

class SettingsPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: SettingsBody(),
    );
  }
}

class SettingsBody extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return SettingsBodyState();
  }
}

class SettingsBodyState extends State<SettingsBody>{

  var _debug = false;

  @override
  Widget build(BuildContext context) {

    debugPaintSizeEnabled = _debug;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[

        SwitchListTile(
            title: Text("主题"),
            activeColor: Theme.of(context).primaryColor,
            value: true,
            onChanged: (bool){

        }),
        Divider(),
        ListTile(
          title: Text("显示边界"),
          trailing: Switch(
              value: _debug,
              activeColor: Theme.of(context).primaryColor,
              onChanged: (bool){
                if(_debug != bool){
                  setState(() {
                    _debug = bool;
                  });
                }
              }),
        ),
        Divider(),
        ListTile(
          title: Text("关于作者"),
          trailing: Icon(Icons.chevron_right),
          onTap: (){},
        ),
        Divider(),
        ListTile(
          title: Text("开源许可"),
          trailing: Icon(Icons.chevron_right),
          onTap: (){
            showAppAboutDialog(context);
          },
        ),
      ],
    );
  }
}