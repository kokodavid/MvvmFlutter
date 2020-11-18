import 'package:flutter/material.dart';
import 'package:newsapp/viewModels/news_article_list_view_model.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {

  @override
  void initState() {
    super.initState();
    Provider.of<NewsArticleListViewModel>(context , listen: false).topHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    var listVieModel = Provider.of<NewsArticleListViewModel>(context);

    return Scaffold(
      appBar: AppBar(

      ),
      body: Text(listVieModel.articles.length.toString()),
    );
  }
}
