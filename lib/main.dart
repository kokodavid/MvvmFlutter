import 'package:flutter/material.dart';
import 'package:newsapp/Screens/news_screen.dart';
import 'package:newsapp/viewModels/news_article_list_view_model.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News Flash',
      theme: ThemeData(
      ),
      home: MultiProvider(
        providers: [ChangeNotifierProvider(
          create: (_) => NewsArticleListViewModel(),
        )],
          child: NewsScreen()
      ),

    );
  }
}

