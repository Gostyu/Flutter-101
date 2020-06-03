import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp (
      title: "Word generator app",
      home:RandomWords(),
      theme: ThemeData(primaryColor: Colors.white),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordState createState() => RandomWordState();
}
class RandomWordState extends State<RandomWords>{
  final List<WordPair> _words = <WordPair>[] ;
  final Set<WordPair> _saved = Set<WordPair>();
  final TextStyle _biggerFont = const TextStyle(fontSize:18);
  
  void _pushSaved(){//go to the fav word screen 
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext ctx){
            final Iterable<ListTile> tiles = _saved.map(
                (WordPair pair){
                  return ListTile(title: Text(pair.asPascalCase,style:_biggerFont)); 
                },
            );
            final List<Widget> divided = ListTile.divideTiles(context:ctx,
            tiles:tiles,).toList();
         return Scaffold(appBar: AppBar(
            title: Center(child : Text("Saved words")),
            ),
            body: ListView(children:divided)
          );
         },
      )
    );
  }
  Widget buildSuggestions(){
    return ListView.builder(itemBuilder: (BuildContext _ctx, int i){
      if(i.isOdd){return Divider();}
      final int index = i~/2;
      if(index>=_words.length){
        _words.addAll(generateWordPairs().take(10));
      }
      return _buildRow(_words[index]);
    });
  }
  Widget _buildRow(WordPair pair){
    final bool alreadySaved = _saved.contains(pair);
    return ListTile(
      title: Text(pair.asCamelCase,style:_biggerFont),
      trailing: Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: ()=>
        setState((){
          if(alreadySaved){
            _saved.remove(pair);
            print("$pair is removed");
          }else{
            _saved.add(pair);
            print("$pair is added");
          }
        })
      ,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text("Word generator"),
      actions: <Widget>[
        IconButton(icon: Icon(Icons.list), onPressed: _pushSaved)
      ],
    ),
      body: buildSuggestions(),
    );    
  }      
}

