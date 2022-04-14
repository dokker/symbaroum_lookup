// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:ffi';

//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
//import 'package:flutter_html/flutter_html.dart';
//import 'package:markdown/markdown.dart' as md;

import 'entities/talent.dart';
//import 'dart:developer' as developer;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Symbaroum Reference',
      home: SearchApp(),
    );
  }
}

class SearchApp extends StatefulWidget {
  const SearchApp({Key? key}) : super(key: key);

  @override
  _SearchAppState createState() => _SearchAppState();
}

class _SearchAppState extends State<SearchApp> {
  final List<Talent> _talents = <Talent>[];
  List<Talent> _foundTalents = <Talent>[];

  // controller for clearing input
  final TextEditingController _controller = TextEditingController();

  // text settings
  final double baseTextSize = 16;

  // Fetch content from Json file
  Future<List<Talent>> readJson() async {
    final String response =
        await rootBundle.loadString('assets/symbaroum_en.json');
    // final data = await json.decode(response);
    final data = json.decode(response);
    final talents = <Talent>[];

    for (var talentJson in data) {
      talents.add(Talent.fromJson(talentJson));
    }
    return talents;
  }

  @override
  void initState() {
    readJson().then((value) {
      setState(() {
        // Initialize talent lists
        _talents.addAll(value);
        _foundTalents = _talents;
      });
    });
    super.initState();
  }

  // Handle null values in list
  String checkNullString(dataItem) {
    return dataItem == null ? '' : dataItem!;
  }

  bool itemHasLevels(dataItem) {
    switch (dataItem.type) {
      case 'talent':
      case 'mystical power':
        return true;
      default:
        return false;
    }
  }

  // filter through the list by keywords
  void _runFilter(String enteredKeyword) {
    List<Talent> results = <Talent>[];
    if (enteredKeyword.isEmpty) {
      // list all when input is empty
      results = _talents;
    } else {
      results = _talents
          .where((element) =>
              // use case insensitive way
              element.name.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    //notify framework about changes
    setState(() {
      //developer.log('run filter', name:'enteredKeyword', error: jsonEncode(results));
      _foundTalents = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  // make a clear button
                  suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        _controller.clear();
                        _runFilter('');
                      }),
                  hintText: 'Search...',
                  border: InputBorder.none),
              onChanged: (value) => _runFilter(value),
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      // handle empty list
      body: _foundTalents.isNotEmpty
          ? _buildSuggestions()
          : const Align(
              alignment: Alignment.center,
              child: Text('No results found', style: TextStyle(fontSize: 24))),
    );
  }

  Widget _buildSuggestions() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(11.0),
            child: _buildRow(index),
          ),
        );
      },
      itemCount: _foundTalents.length,
    );
  }

  Widget _buildRow(int index) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
        Widget>[
      Row(children: [
        Text(
          _foundTalents[index].name,
          style: TextStyle(
            fontSize: baseTextSize + 2,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        Text(
          _foundTalents[index].type,
          style: TextStyle(
            fontSize: baseTextSize,
            fontWeight: FontWeight.w500,
          ),
        ),
      ]),
      const SizedBox(height: 10),
      Text(
        checkNullString(_foundTalents[index].description),
        style: TextStyle(
          fontStyle: FontStyle.italic,
          fontSize: baseTextSize,
        ),
      ),
      const SizedBox(height: 10),
      RichText(
          text: TextSpan(
              style: TextStyle(
                fontSize: baseTextSize,
                color: Colors.black,
              ),
              children: itemHasLevels(_foundTalents[index])
                  ? <TextSpan>[
                      const TextSpan(
                          text: 'Novice ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text: checkNullString(_foundTalents[index].novice))
                    ]
                  : <TextSpan>[
                      TextSpan(
                          text: checkNullString(_foundTalents[index].novice))
                    ])),
      checkNullString(_foundTalents[index].adept).isEmpty
          ? Container()
          : RichText(
              text: TextSpan(
                  style: TextStyle(
                    fontSize: baseTextSize,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                  const TextSpan(
                      text: 'Adept ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: checkNullString(_foundTalents[index].adept))
                ])),
      checkNullString(_foundTalents[index].adept).isEmpty
          ? Container()
          : RichText(
              text: TextSpan(
                  style: TextStyle(
                    fontSize: baseTextSize,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                  const TextSpan(
                      text: 'Master ',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: checkNullString(_foundTalents[index].master))
                ]))
    ]);
  }
}
