import 'package:flutter/material.dart';
import 'package:youtube_app/video_detail_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final items = List<String>.generate(10000, (i) => "Item $i");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          leading: Icon(Icons.videocam),
          title: const Text('KBOYのFlutter大学'),
          actions: <Widget>[
            SizedBox(
              width: 44,
              child: FlatButton(
                child: Icon(Icons.search),
                onPressed: () {
                  // TODO
                },
              ),
            ),
            SizedBox(
              width: 44,
              child: FlatButton(
                child: Icon(Icons.more_vert),
                onPressed: () {
                  // TODO
                },
              ),
            ),
          ],
        ),
        body:  Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.network(
                          'https://yt3.ggpht.com/ytc/AAUvwng4tQ0GjNvQN6XMMV8G4ISM5HXt-y2xhvFSMPiD=s176-c-k-c0x00ffffff-no-rj'
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Column(
                      children: <Widget>[
                        const Text(
                          'KBOYのFlutter大学',
                        ),
                        FlatButton(
                          child: Row(
                            children: <Widget>[
                              Icon(
                                  Icons.video_call,
                                color: Colors.red,
                              ),
                              Text('登録する')
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () async {
                        // TODO: 画面遷移
                        await Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => VideoDetailPage()),
                        );
                      },
                      leading: Image.network(
                          'https://i.ytimg.com/vi/SHoTRjzc1lI/hqdefault.jpg?sqp=-oaymwEcCPYBEIoBSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLAZ2kwjN_oB2XLHtLgTEQv2o2MDUQ'
                      ),
                      title: Column(
                        children: <Widget>[
                          Text('[Flutter超入門] リストを作る方法'),
                          Row(
                            children: <Widget>[
                              Text(
                                '267回再生',
                                style: TextStyle(fontSize: 13),
                              ),
                              Text(
                                '5日前',
                                style: TextStyle(fontSize: 13),
                              )
                            ],
                          )
                        ],
                      ),
                      trailing: Icon(Icons.more_vert),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
