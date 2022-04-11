// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

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
  List<Talent> _talents = <Talent>[];

  // Fetch content from Json file
  Future<List<Talent>> readJson() async {
      final String response = await rootBundle.loadString('assets/symbaroum_en.json');
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
        _talents.addAll(value);
      });
    });
    super.initState();
  }

  String checkNullString(dataItem) {
    return dataItem == null ? '' : dataItem!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Symbaroum Reference'),
      ),
      body: _buildSuggestions(),
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
      itemCount: _talents.length,
    );
  }

  Widget _buildRow(int index) {
    // String description;
    // if (_talents[index].description == null) {
    //   description = '';
    // } else {
    //   description = _talents[index].description!;
    // }
    //developer.log(description);
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(children: [
            Text(
              _talents[index].name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Text(
              _talents[index].type,
              style: const TextStyle(
                //fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ]),

          Text(
            checkNullString(_talents[index].description),
            style: const TextStyle(
              fontStyle: FontStyle.italic,

            ),
          ),
          const SizedBox(height: 10),
          RichText(text: TextSpan(
              style: const TextStyle(
                fontSize: 14.0,
                color: Colors.black,
              ),
              children: <TextSpan>[
                const TextSpan(text: 'Novice ',  style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: checkNullString(_talents[index].novice))
              ]
          )),
          RichText(text: TextSpan(
              style: const TextStyle(
                fontSize: 14.0,
                color: Colors.black,
              ),
              children: <TextSpan>[
                const TextSpan(text: 'Adept ',  style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: checkNullString(_talents[index].adept))
              ]
          )),
          RichText(text: TextSpan(
              style: const TextStyle(
                fontSize: 14.0,
                color: Colors.black,
              ),
              children: <TextSpan>[
                const TextSpan(text: 'Master ',  style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: checkNullString(_talents[index].master))
              ]
          ))
        ]
    );
  }
}

