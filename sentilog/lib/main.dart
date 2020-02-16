import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'dart:math';


void main() => runApp(MyApp());

// #docregion MyApp
class MyApp extends StatelessWidget {
  // #docregion build
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sentilog',
      home: RandomWords(),
    );
  }
// #enddocregion build
}
// #enddocregion MyApp

// #docregion RWS-var
class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  // #enddocregion RWS-var

  // #docregion _buildSuggestions

  Widget _buildSuggestions() {
    return ConstrainedBox(
      constraints: new BoxConstraints(
        minHeight: 200.0,
        maxHeight: 300.0,
      ),

      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return Divider(); /*2*/

          final index = i ~/ 2; /*3*/
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10)); /*4*/
          }
          return _buildRow(_suggestions[index]);
        }),
    );
  }

  Widget _coreApp(){
    return Column(children: <Widget>[
      ConstrainedBox(
        constraints: new BoxConstraints(
          minHeight: 200.0,
          maxHeight: 300.0,
        ),

        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(16.0),
            itemBuilder: /*1*/ (context, i) {
              if (i.isOdd) return Divider(); /*2*/

              final index = i ~/ 2; /*3*/
              if (index >= _suggestions.length) {
                _suggestions.addAll(generateWordPairs().take(10)); /*4*/
              }
              return _buildRow(_suggestions[index]);
            }),
      ),
      Container(
        height: 502,
        child: Card(
          color: Colors.white,
          child: Container(
            padding: const EdgeInsets.all(50.0),
            child: Column(children: <Widget>[
              Center(child: Text("How are you feeling ?", style: TextStyle(color: Colors.black, fontSize: 20.0),)),
              Center(child:new Container(height:60.0, margin: const EdgeInsets.all(30.0), child:ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    margin: const EdgeInsets.all(5.0),
                    width: 48.0,
                    height: 48.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.0), color: new Color(0xff6e9df6)),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    margin: const EdgeInsets.all(5.0),
                    width: 48.0,
                    height: 48.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.0), color: new Color(0xff597ff8)),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    margin: const EdgeInsets.all(5.0),
                    width: 48.0,
                    height: 48.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.0), color: new Color(0xff2231fc)),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    margin: const EdgeInsets.all(5.0),
                    width: 48.0,
                    height: 48.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.0), color: new Color( 0xffd9d9ff)),
                  ),
                ]
              ))),
            ]),
          ),
        ),
      ),
      ]
    );
  }
  // #enddocregion _buildSuggestions

  // #docregion _buildRow
  Widget _buildRow(WordPair pair) {

    var lst = new List(4);
    lst[0] = 0xff6e9df6;
    lst[1] = 0xff597ff8;
    lst[2] = 0xff2231fc;
    lst[3] = 0xffd9d9ff;

    var rng = new Random();



    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Card(
        color: Colors.white,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.2,
          child: GridView.count(
            // Create a grid with 2 columns. If you change the scrollDirection to
            // horizontal, this produces 2 rows.
            crossAxisCount: 7,
            padding: const EdgeInsets.all(5.0),
            mainAxisSpacing: 5.0,
            crossAxisSpacing: 5.0,
            // Generate 100 widgets that display their index in the List.
            children: List.generate(30, (index) {
              return Container(
                  margin: const EdgeInsets.all(0.0),
                  padding: const EdgeInsets.all(0.0),
                  //color: const Color(0xff74b9ff),
                  width: 5.0,
                  height: 5.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2.0), color: new Color(lst[rng.nextInt(100)%4])),
              );
            }),
          )
          ,
        ),
      ),
    );
  }
  // #enddocregion _buildRow

  // #docregion RWS-build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sentilog'),
      ),
      body: _coreApp(),
    );
  }
// #enddocregion RWS-build
// #docregion RWS-var
}
// #enddocregion RWS-var

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}
