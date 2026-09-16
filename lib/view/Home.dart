import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:news/view/newsPage.dart';
import 'package:news/view_model/articlesList_ViewModel.dart';
import 'package:provider/provider.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({super.key });

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ArticleslistViewmodel>(context, listen: false).fetchArticles();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[250],
        title: Text("Home")
      ),
      body: Consumer<ArticleslistViewmodel>(
        builder: (context, viewModel, child){
          if(viewModel.articlesList.isEmpty){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return RefreshIndicator(
            onRefresh: ()async{
              await viewModel.fetchArticles();
            },
            child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: viewModel.articlesList.length,
                itemBuilder: (context, index){
                  final article = viewModel.articlesList[index];
                  return InkWell(
                    onTap: (){
                      Get.to(() => ArticleDetailPage(article: article));
                    },
                  child: Card(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    elevation: 3,
                    child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            if (article.imageUrl != null && article.imageUrl!.isNotEmpty)
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  article.imageUrl!,
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                  const Icon(Icons.broken_image, size: 50),
                                ),
                              )
                            else
                              const Icon(Icons.image_not_supported, size: 50),

                            const SizedBox(width: 10),

                            // 2. الجزء المتبقي عادي جوه الـ children
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    article.title ?? "بدون عنوان",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    article.desc ?? "لا يوجد وصف متاح",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                  ),
                  ),
                  );
                },
            ),
          );
        },
      ),
    );
  }
}