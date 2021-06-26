import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newscloud/models/article.dart';
import 'package:newscloud/models/articles_model.dart';

class NewsApi {
  final String baseUrl = 'https://newsapi.org';
  final String endPoint = '/v2/top-headlines';
  final String apiKey = 'a25dc8dbc5724e7e81dca6a4ed3f1a87';

  // ignore: missing_return
  Future<List<Article>> fetchArticles() async{
    try {
      http.Response response = await http.get(
          baseUrl + endPoint + '?country=eg&apiKey=$apiKey');
      if(response.statusCode == 200){
        String data = response.body;
        var jsonData = jsonDecode(data);
        ArticlesModel articlesInstance = ArticlesModel.fromJson(jsonData);
        List<Article> articles = articlesInstance.articles.map((e) => Article.fromJson(e)).toList();
        return articles;
      }else{
        print('status code = ${response.statusCode}');
      }
    } catch(ex){
      print(ex);
    }
  }

  // ignore: missing_return
  Future<List<Article>> fetchArticlesByCategory(String category) async{
    try {
      http.Response response = await http.get(
          baseUrl + endPoint + '?country=eg&category=$category&apiKey=$apiKey');
      if(response.statusCode == 200){
        String data = response.body;
        var jsonData = jsonDecode(data);
        ArticlesModel articlesInstance = ArticlesModel.fromJson(jsonData);
        List<Article> articles = articlesInstance.articles.map((e) => Article.fromJson(e)).toList();
        return articles;
      }else{
        print('status code = ${response.statusCode}');
      }
    } catch(ex){
      print(ex);
    }
  }
}
