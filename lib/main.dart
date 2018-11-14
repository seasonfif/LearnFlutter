import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: RandomWords()
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  createState() => RandomWordsState();

}

class RandomWordsState extends State {
  
  final _suggestions = [];

  final _saved = Set();
  
  final _biggerFont = TextStyle(fontSize: 18.0);
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Startup Name Generator"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list), onPressed: _pushSaved)
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions(){
    
    return ListView.builder(
        padding: const EdgeInsets.all(13.0),
        itemBuilder: (context, i){
          if(i.isOdd) return Divider();

          final index = i ~/ 2;
          if(index >= _suggestions.length){
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
    });
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);

    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),

      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),

      onTap: (){
        setState(() {
          if(alreadySaved){
            _saved.remove(pair);
          }else{
            _saved.add(pair);
          }
        });
      },
    );
  }
  

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context){
            final tiles = _saved.map(
                (pair){
                  return ListTile(
                    title: Text(
                      pair.asPascalCase,
                      style: _biggerFont,
                    ),
                  );
                },
            );
            final divided = ListTile.divideTiles(
                context: context,
                tiles: tiles)
                .toList();

            return Scaffold(
              appBar: AppBar(
                title: Text("Saved Suggestions"),
              ),
              body: ListView(children: divided),
            );
          })
    );
  }
}