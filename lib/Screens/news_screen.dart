import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/utils/constants.dart';
import 'package:newsapp/viewModels/news_article_list_view_model.dart';
import 'package:newsapp/widgets/news_grid.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<NewsArticleListViewModel>(context, listen: false)
        .topHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    var listVieModel = Provider.of<NewsArticleListViewModel>(context);

    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            PopupMenuButton(
                onSelected: (country) {
                  listVieModel
                      .topCountryHeadlines(Constants.Countries[country]);
                },
                icon: Icon(Icons.more_vert),
                itemBuilder: (_) {
                  return Constants.Countries.keys
                      .map((v) => PopupMenuItem(
                            value: v,
                            child: Text(v),
                          ))
                      .toList();
                })
          ],
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text(
                  "News",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 45),
                ),
              ),
              Divider(
                color: Color(0xffff8a30),
                height: 40,
                thickness: 8,
                indent: 30,
                endIndent: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30, top: 15, bottom: 15),
                child: Text(
                  "Headline",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Expanded(
                  child: NewsGrid(
                articles: listVieModel.articles,
              ))
            ],
          ),
        ));
  }
}
