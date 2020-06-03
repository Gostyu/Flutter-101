import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title:Text("Words Generator")
          ),
          body: RandomWords(),
            floatingActionButton: FloatingActionButton(
              onPressed: null,
              child:Text("click"),
              backgroundColor: Colors.blue,
               )
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordState createState() => RandomWordState();
}
class RandomWordState extends State<RandomWords>{
  final List<WordPair> _words = <WordPair>[] ;
  final TextStyle _biggerFont = const TextStyle(fontSize:18);

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
    return ListTile(
      title: Text(pair.asCamelCase,style:_biggerFont),
    );
  }
  @override
      Widget build(BuildContext context) {
        return buildSuggestions();
      }      
}

