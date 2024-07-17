import 'package:flutter/material.dart';
import 'package:k_news/pages/article.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

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
        onRefresh: _handleRefresh,
        color: Colors.blueAccent,
        height:200,
        backgroundColor: Colors.grey[200],
        showChildOpacityTransition: false,
        animSpeedFactor:2,
        child: ListView(scrollDirection: Axis.vertical, children: const [
          Article(
              title: "The new revolutionarly app is here",
              image: "https://news-and-weather.vercel.app/icons/logo.png",
              description:
                  "The new revolutionarly app is here bringing you news straight to your fingertips",
              author: "JKF. Martin",
              date: "12th July, 2024"),
          Article(
              title: "The new revolutionarly app is here",
              image: "https://news-and-weather.vercel.app/icons/logo.png",
              description:
                  "The new revolutionarly app is here bringing you news straight to your fingertips",
              author: "JKF. Martin",
              date: "12th July, 2024"),
        ]),
      ),
    );
  }

  Future<void> _handleRefresh() {
    return Future.delayed(const Duration(seconds: 2));
  }
}
