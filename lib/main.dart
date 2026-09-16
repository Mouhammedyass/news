import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/view/Home.dart';
import 'package:news/view_model/articlesList_ViewModel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ArticleslistViewmodel()..fetchArticles(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.grey,
            titleTextStyle: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            iconTheme: IconThemeData(color: Colors.black),
          ),
        ),
        initialRoute: "/home",
        getPages: [
          GetPage(name: "/home", page: () => const MyHomeScreen()),
        ],
      ),
    );
  }
}