// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Symbaroum Reference',
      home: const SearchApp(),
    );
  }
}

class SearchApp extends StatefulWidget {
  const SearchApp({Key? key}) : super(key: key);

  @override
  _SearchAppState createState() => _SearchAppState();
}

class _SearchAppState extends State<SearchApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Symbaroum Reference'),
      ),
      body: _buildSuggestions(),
    );
  }
}

Widget _buildSuggestions() {
  return ListView.builder(
    itemBuilder: (context, index) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(11.0),
          child: _buildRow(),
        ),
      );
    },
    itemCount: 5,
  );
}

Widget _buildRow() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        'Note title',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      Text('Note Text'),
    ]
  );
}
