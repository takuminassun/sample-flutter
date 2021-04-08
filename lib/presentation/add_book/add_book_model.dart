import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:youtube_app/domain/book.dart';

class AddBookModel extends ChangeNotifier {
  String bookTitle = '';
  File imageFile;
  bool isLoading = false;

  startLoading() {
    isLoading = true;
    notifyListeners();
  }

  endLoading() {
    isLoading = false;
    notifyListeners();
  }

  Future showImagePicker() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    imageFile = File(pickedFile.path);
    notifyListeners();
  }

  Future addBookToFirebase() async {
    if (bookTitle.isEmpty) {
      throw ('タイトルを入力してください');
    }
    final imageURL = await _uploadImage();

    Firestore.instance.collection('books').add(
      {
        'title': bookTitle,
        'imageURL': imageURL,
        'createdAt': Timestamp.now(),
      },
    );
  }

  Future updateBook(Book book) async {
    final imageURL = await _uploadImage();

    final document =
        Firestore.instance.collection('books').document(book.documentId);
    await document.updateData(
      {
        'title': bookTitle,
        'imageURL': imageURL,
        'updatedAt': Timestamp.now(),
      },
    );
  }

  Future _uploadImage() async {
    final storage = FirebaseStorage.instance;
    StorageTaskSnapshot snapshot = await storage
        .ref()
        .child('books/$bookTitle')
        .putFile(imageFile)
        .onComplete;
    print("--------- ${snapshot.ref}");

    final String downloadUrl =
        await snapshot.ref.getDownloadURL().catchError((e) => {print(e)});
    return downloadUrl;
  }
}
