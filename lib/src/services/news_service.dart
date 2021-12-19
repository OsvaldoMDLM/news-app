import 'package:flutter/material.dart';
import 'package:news_app/src/models/news_response.dart';
import 'package:http/http.dart' as http;

final _URL_NEWS = 'https://newsapi.org/v2';
final _API_NEWS = '4d12c47673b74ae18e757da435bf1629';

class NewsService with ChangeNotifier {
  List<Article> headlines = [];

  NewsService() {
    getTopHeadlines();
  }

  getTopHeadlines() async {
    final uri =
        Uri.parse('$_URL_NEWS/top-headlines?country=mx&pageSize=50&apiKey=$_API_NEWS');
    final response = await http.get(uri);
    final newsResponse = NewsResponse.fromJson(response.body);
    headlines.addAll(newsResponse.articles);
    notifyListeners();
  }
}
