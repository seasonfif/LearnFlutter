
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:learn_flutter/redux/count_state.dart';
import 'package:redux/redux.dart';

class ReduxApp extends StatelessWidget{

 final Store<CountState> store;

 ReduxApp(this.store);

@override
  Widget build(BuildContext context) {
    return StoreProvider<CountState>(
      store: store,
      child: MaterialApp(
        title: 'Redux Demo',
        home: TopScreen(),
      ),
    );
  }
}

class TopScreen extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return TopScreenState();
  }
}

class TopScreenState extends State<TopScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top Screen'),
      ),
      body: Center(
      
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              StoreConnector<CountState, int>(
                converter: (store)=>
                  store.state.count,
                builder: (context, count)=>Text(
                  count.toString(),
                  style: Theme.of(context).textTheme.display1,
                ),
              ),

              StoreConnector<CountState,VoidCallback>(
                converter: (store) {
                  return () => store.dispatch(CountAction.increment);
                },
                builder: (context, callback) {
                  return IconButton(
                    onPressed: callback,
                    icon: Icon(Icons.add),
                  );
                },
              ),
            ],
          ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context)=>UnderScreen()
          ));
        },
        child: Icon(Icons.forward),
      ),
    );
  }
}

class UnderScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => UnderScreenState();
}

class UnderScreenState extends State<UnderScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Under Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times:',),
            StoreConnector<CountState, int>(
              converter: (store)=> store.state.count,
              builder: (context, count)=>
                Text(
                  count.toString(),
                  style: Theme.of(context).textTheme.display1,),
            )
          ],
        ),
      ),
      floatingActionButton: StoreConnector<CountState,VoidCallback>(

        converter: (store) {
          return () => store.dispatch(CountAction.increment);
        },
        builder: (context, callback) {
          return FloatingActionButton(
            onPressed: callback,
            child: Icon(Icons.add),
          );
        },
      ),
    );
  }
}