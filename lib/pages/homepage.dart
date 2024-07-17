import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:k_news/pages/article.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class Homepage extends StatelessWidget {
  //get data from url
  List<Map<String, String>> newsArticles = [];
  Homepage({super.key});
  static int page = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "K news",
          style: TextStyle(
            fontWeight: FontWeight.w900,
            color: Colors.grey[200],
          ),
        ),
        leading: Icon(
          Icons.newspaper_outlined,
          color: Colors.grey[200],
          size: 40,
        ),
        elevation: 0,
        backgroundColor: Colors.blueAccent,
      ),
      body: LiquidPullToRefresh(
        onRefresh: getNews,
        color: Colors.blueAccent,
        height: 200,
        backgroundColor: Colors.grey[200],
        showChildOpacityTransition: false,
        animSpeedFactor: 2,
        child: FutureBuilder(
          future: getNews(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                  itemCount: newsArticles.length,
                  itemBuilder: (context, index) {
                    return Article(
                      title: (newsArticles[index]['title']).toString(),
                      image: newsArticles[index]['image'].toString(),
                      description:newsArticles[index]['description'].toString(),
                      author: newsArticles[index]['author'].toString(),
                      date: newsArticles[index]['date'].toString(),
                      content: newsArticles[index]['content'].toString(),
                    );
                  });
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  Future getNews() async {
    newsArticles = [];
    var response =
        await http.get(Uri.https("news-feed-ke.vercel.app", "/news",{'page':page.toString()}));
    var data = jsonDecode(response.body)['content'];
    for (var article in data) {
      final singleArticle = {
        "date": article['date'].toString(),
        "author": article['author'].toString(),
        "title": article['title'].toString(),
        "description": article['image_description'].toString(),
        "content": article['content'].toString(),
        "image": article['image_url'].toString(),
      };
      newsArticles.add(singleArticle);
    }
    print(newsArticles.length);
    page++;
  }

  // Future<void> _handleRefresh() {
  //   return Future.delayed(const Duration(seconds: 2));
  // }
}
