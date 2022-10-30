// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sort_child_properties_last, sized_box_for_whitespace

import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class RandomWords extends StatefulWidget {
  const RandomWords({super.key});

  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFonts = TextStyle(fontSize: 18.5, fontWeight: FontWeight.w700);
  final _saved = <WordPair>{};
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("StartUp Names"),
          centerTitle: true,
          leading: IconButton(
            onPressed: _pushedSaved,
            icon: Icon(Icons.list),
            tooltip: "Saved names",
          ),
        ),
        body: ListView.builder(
          padding: EdgeInsets.all(10.5),
          itemBuilder: (_, i) {
            if (i.isOdd) return Divider();
            final index = i ~/ 2;
            if (index >= _suggestions.length) {
              _suggestions.addAll(generateWordPairs().take(10));
            }
            final alreadySaved = _saved.contains(_suggestions[index]);
            return ListTile(
              title:
                  Text(_suggestions[index].asPascalCase, style: _biggerFonts),
              trailing: Icon(
                alreadySaved ? Icons.favorite : Icons.favorite_border,
                color: alreadySaved ? Colors.red : null,
                semanticLabel: alreadySaved ? "Remove from saved" : "Saved",
              ),
              onTap: () {
                setState(() {
                  if (alreadySaved) {
                    _saved.remove(_suggestions[index]);
                  } else {
                    _saved.add(_suggestions[index]);
                  }
                });
              },
            );
          },
        ),
      ),
    );
  }

  void _pushedSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) {
          final tiles = _saved.map(
            (pair) {
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                  style: _biggerFonts,
                ),
              );
            },
          );
          final divided = tiles.isNotEmpty
              ? ListTile.divideTiles(
                  context: context,
                  tiles: tiles,
                ).toList()
              : <Widget>[];
          return SafeArea(
            child: Scaffold(
              appBar: AppBar(
                title: Text("Favourite Names"),
                centerTitle: true,
                leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(Icons.arrow_back_ios),
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "profile");
                    },
                    icon: Icon(Icons.account_box),
                  ),
                ],
              ),
              body: ListView(children: divided),
            ),
          );
        },
      ),
    );
  }
}
