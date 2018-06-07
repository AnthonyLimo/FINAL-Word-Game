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

  final _sentences = <String>[];
  final _biggerFont = const TextStyle(fontSize: 14.0);


  @override
  Widget build(BuildContext context){
    final noun = new WordNoun.random();
    final adjective =  new WordAdjective.random();
    return  new Text("");
  }

  String _getSentence(){
    final noun = new WordNoun.random();
    final adj = new WordAdjective.random();
    return "The quick ${noun.asCapitalized} jumped over the ${adjective.asCapitalized} ${noun.asCapitalized}";
  }

  Widget _buildRow(String sentence) {
    return new ListTile(
      title: new Text(
        sentence,
        style: _biggerFont,
      )
    );
  }

  Widget _buildSentence(){
    return new ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i){
        if(i.isOdd) return new Divider();

        final index = i ~/ 2;

        if(index >= _sentences.length){
          for (int x=0; x< 10; x++){
            _sentences.add(_getSentence());
          }
        }

        return _buildRow(_sentences[index]);
      },
    );
  }
}