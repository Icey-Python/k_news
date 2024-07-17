import "package:flutter/material.dart";
import "package:k_news/pages/article_page.dart";

class Article extends StatelessWidget {
  const Article(
      {super.key,
      required this.title,
      required this.image,
      required this.description,
      required this.author,
      required this.date});

  //declare the required
  final String title;
  final String image;
  final String description;
  final String author;
  final String date;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //push data to next page
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticlePage(data: {
                      "title": title,
                      "image": image,
                      "description": description,
                      "author": author,
                      "date": date
                    })));
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //title
              Text(
                title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //date
                  Text(
                    date,
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  //author text
                  Text(
                    author,
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              //image
              Image.network(
                image,
                width: 300,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                height: 10,
              ),
              //description
              Text(
                description,
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
