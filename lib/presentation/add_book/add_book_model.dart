import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:youtube_app/domain/book.dart';

class AddBookModel extends ChangeNotifier {
  String bookTitle = '';

  Future addBookToFirebase() async {
    if (bookTitle.isEmpty) {
      throw ('タイトルを入力してください');
    }

    Firestore.instance.collection('books').add(
      {
        'title': bookTitle,
      },
    );
  }

  Future updateBook(Book book) async {
    final document =
        Firestore.instance.collection('books').document(book.documentId);
    await document.updateData(
      {
        'title': bookTitle,
        'updatedAt': Timestamp.now(),
      },
    );
  }
}
