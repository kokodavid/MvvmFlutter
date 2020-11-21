import 'package:flutter/material.dart';
import 'package:newsapp/viewModels/news_article_view_model.dart';
import 'package:newsapp/widgets/circle_image.dart';

class NewsArticleDetailScreen extends StatelessWidget {
  final NewsArticleViewModel article;

  NewsArticleDetailScreen({this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/'),
            ),
            SizedBox(
              height: 5,
              width: 10,
            ),
            Container(
              constraints: BoxConstraints(maxWidth: 150),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Author',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    this.article.author ?? 'undefined',
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left:30,right: 10 ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              alignment: Alignment.centerLeft,
              children: <Widget>[
                Divider(
                  color: Color(0xffff8a30),
                  thickness: 30,
                  height: 80,
          
                ),
                Text(
                  ' Headline',
                  style: TextStyle(
                    fontSize: 14,
                     color: Colors.white
                     ),
                )
              ],
            ),
            Text(
              this.article.title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                wordSpacing: 3
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              this.article.publishedAt,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 200,
              child: CircleImage(imageUrl: this.article.urlToImage,),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              this.article.description,
              style: TextStyle(
                fontSize: 16,
                wordSpacing: 3,
              ),
            )
          ],

        ),
      ),
    );
  }
}
