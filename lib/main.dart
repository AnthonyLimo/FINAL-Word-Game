import 'package:flutter/material.dart';
import 'package:random_words/random_words.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  //Create instances of random words

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "Word Game",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Word Game"),
        ),
        body: new Center(
          child: new RandomSentences()
        ),
      ),
    );
  }
}

class RandomSentences extends StatefulWidget{
  @override
  createState() => new _RandomSentencesState();
}

class _RandomSentencesState extends State<RandomSentences> {
  @override
  Widget build(BuildContext context){
    final noun = new WordNoun.random();
    final adjective =  new WordAdjective.random();
    return  new Text("The quick ${noun.asCapitalized} jumped over the ${adjective.asCapitalized} ${noun.asCapitalized}");
  }
}