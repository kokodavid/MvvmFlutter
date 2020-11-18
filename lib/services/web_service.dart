import 'package:dio/dio.dart';
import 'package:newsapp/models/news_article.dart';

class WebService{
  var dio = new Dio();

  Future<List<NewsArticle>> fetchTopHeadlines() async{
    String url = 'http://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=1428f88677af4d5f86c3f12d3601ca89';

    final response = await dio.get(url);

    if(response.statusCode == 200){
        final result = response.data;
        Iterable list = result['articles'];
        return  list.map((article) => NewsArticle.fromJson(article)).toList();
    }else{
      throw Exception("Failed to get News");
    }

  }

}