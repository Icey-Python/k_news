import "package:flutter/material.dart"; 

class KAppBar extends StatelessWidget {
  const KAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return AppBar(
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
      );
  }
}
