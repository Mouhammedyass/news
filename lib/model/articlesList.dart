import 'dart:convert';

import 'package:news/model/article.dart';

class Articleslist {
  final List<dynamic> articles;
  Articleslist({required this.articles});

  factory Articleslist.fromJson(Map <String, dynamic> jsonData){
    return Articleslist(
    articles: jsonData['articles']
    );
}
}
