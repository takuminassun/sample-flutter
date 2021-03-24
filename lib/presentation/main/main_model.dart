
import 'package:flutter/material.dart';

class MainModel extends ChangeNotifier {
  String sampleText = 'サンプルアプリダヨ！！';

  void changeSampleText() {
    sampleText = 'サンプルアプリさすが！！';
    notifyListeners();
  }
}
