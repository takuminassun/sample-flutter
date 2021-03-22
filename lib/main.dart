import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// model
import 'package:youtube_app/main_model.dart';

// page
import 'book_list_page.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: ChangeNotifierProvider<MainModel>(
        create: (_) => MainModel(),
        child: Scaffold(
          appBar: AppBar(title: Text('サンプルアプリ')),
          body: Consumer<MainModel>(builder: (context, model, child) {
            return Center(
              child: Column(
                children: [
                  Text(
                    model.sampleText,
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  RaisedButton(
                    child: Text('ボタン'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BookListPage()));
                      model.changeSampleText();
                    },
                  )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
