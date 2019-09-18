
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:learn_flutter/scoped_model/count_model.dart';
import 'package:scoped_model/scoped_model.dart';

class ScopeApp extends StatelessWidget{

  final CountModel countModel = CountModel();

  @override
  Widget build(BuildContext context) {
    return ScopedModel<CountModel>(
        model: countModel,
        child: MaterialApp(
          home: FirstScreen(),
        ),
    );
  }
}

class FirstScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => FirstScreenState();
}

class FirstScreenState extends State<FirstScreen>{

@override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<CountModel>(
      builder: (context, child, model)=> Scaffold(
        appBar: AppBar(
        title: Text('First Screen'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                model.count.toString(),
                style: TextStyle(
                  fontSize: 48.0
                  ),
              ),
              FloatingActionButton(
                onPressed: (){
                  CountModel.of(context).increment();
                },
                child: Icon(Icons.add),
                heroTag: "first floatingActionButton",
              )
            ],
          )
        ),
        floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context)=>SecondScreen()
          ));
        },
        child: Icon(Icons.forward),
        heroTag: 'second floatingActionButton',
      ),
      ),
    );
  }
}

class SecondScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => SecondScreenState();
  }
  
  class SecondScreenState extends State<SecondScreen>{

    @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<CountModel>(
      builder: (context, child, model)=>Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times:',),
            Text(model.count.toString(),
                style: Theme.of(context).textTheme.display1,),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          CountModel model = CountModel.of(context);
          model.increment();
        },
        child: Icon(Icons.add),
      ),  
    ),
    );
  }
}


