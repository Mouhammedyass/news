import 'package:flutter/cupertino.dart';
import 'package:news/model/article.dart';
import 'package:news/model/articlesList.dart';
import 'package:news/view_model/crud.dart';

class ArticleslistViewmodel extends ChangeNotifier{
  List<Article> _articlesList = [];

  Future<void> fetchArticles()async{
    _articlesList = await Crud().fetchArticles();
    notifyListeners();
  }

  List<Article> get articlesList => _articlesList;
}