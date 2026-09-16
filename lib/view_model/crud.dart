import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news/model/article.dart';
import 'package:news/model/articlesList.dart';
import 'package:news/model/linksapi.dart';

class Crud {
  Future<List<Article>>fetchArticles() async {
    try {
      var response = await http.get(Uri.parse(linkServerName));
      if (response.statusCode == 200 || response.statusCode == 201) {
        var responseBody = jsonDecode(response.body);
        Articleslist articles = Articleslist.fromJson(responseBody);
        List<Article> aritcleList = articles.articles.map((e) => Article.fromJson(e)).toList();
        return aritcleList;
      } else {
        print("Error ${response.statusCode}");
      }
    } catch (e) {
      print("Error catch $e");
    }
    return [];
  }
}