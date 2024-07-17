import "package:flutter/material.dart";

class ArticlePage extends StatelessWidget {
  const ArticlePage({super.key, required this.data});
  final Map<String, dynamic> data;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
            child: Column(
              children: [
                Image.network(
                  data["image"],
                  width: 350,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  data["title"],
                  style:
                      const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  data["description"],
                  style:
                      const TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                  softWrap: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding:const EdgeInsets.symmetric(vertical: 0,horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(data["author"]),
                      const SizedBox(width:10), 
                      Text(data["date"]),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
