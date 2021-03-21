import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BookList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('サンプルアプリ')
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('books').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return new ListView(
            children: snapshot.data.documents.map((DocumentSnapshot document) {
                return new ListTile(
                  title: Text(document['title']),
                );
              }).toList(),
          );
        },
      ),
    );
  }
}
