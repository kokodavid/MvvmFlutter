import 'package:flutter/material.dart';
import 'package:newsapp/models/news_article.dart';
import 'package:newsapp/services/web_service.dart';
import 'package:newsapp/viewModels/news_article_view_model.dart';

enum LoadingStatus{
  completed,
  searching,
  empty
}

class NewsArticleListViewModel with ChangeNotifier{
  LoadingStatus loadingStatus = LoadingStatus.empty;
  List<NewsArticleViewModel> articles = List<NewsArticleViewModel>();


  void topHeadlines() async {
    List<NewsArticle> newsArticles = await WebService().fetchTopHeadlines();
    loadingStatus = LoadingStatus.searching;
    notifyListeners();

    this.articles = newsArticles.map((article) => NewsArticleViewModel(article: article)).toList();

    if(this.articles.isEmpty){
      this.loadingStatus = LoadingStatus.empty;
    }else{
      this.loadingStatus = LoadingStatus.completed;
    }
    notifyListeners();
  }
}