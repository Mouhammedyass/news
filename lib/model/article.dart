class Article {
   final String? title;
   final String? desc;
   final String? imageUrl;
   final String? articleUrl;
   final String? publishDate;
  const Article({required this.title, required this.desc, required this.imageUrl, required this.articleUrl, required this.publishDate});

factory Article.fromJson(Map <String, dynamic> jsonData){
    return Article(
        title: jsonData['title'],
        desc: jsonData['description'],
        imageUrl: jsonData['urlToImage'],
        articleUrl: jsonData['url'],
        publishDate: jsonData['publishedAt']);
}
}