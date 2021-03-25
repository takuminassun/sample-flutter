import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_app/presentation/login/login_page.dart';

// model
import 'package:youtube_app/presentation/main/main_model.dart';

// page
import '../book_list/book_list_page.dart';
import 'package:youtube_app/presentation/signup/signup_page.dart';

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
                    child: Text('新規登録'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpPage()));
                      model.changeSampleText();
                    },
                  ),
                  RaisedButton(
                    child: Text('ログイン'),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
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
