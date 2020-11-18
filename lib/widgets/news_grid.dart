import 'package:flutter/material.dart';
import 'package:newsapp/viewModels/news_article_view_model.dart';
import 'package:newsapp/widgets/circle_image.dart';

class NewsGrid extends StatelessWidget {
  final List<NewsArticleViewModel> articles;

  NewsGrid({this.articles});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
      SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        var article = articles[index];
        return GridTile(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: CircleImage(
              imageUrl: article.urlToImage,
            ),
          ),
          footer: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(article.title,style: TextStyle(
              fontWeight: FontWeight.bold
            ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis
            ),
          ),
        );
      },
      itemCount: this.articles.length,
    );
  }
}
