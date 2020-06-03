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
          title:Text("First App")
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
  
  @override
  Widget build(BuildContext context) {
    final WordPair wordPair = WordPair.random();
    return  Center(
            child: Text(wordPair.asPascalCase),
            );
  }

}
