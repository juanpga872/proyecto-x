import 'package:flutter/material.dart';

class TweetCard extends StatelessWidget {
  final String userName;
  final String tweetContent;

  TweetCard({required this.userName, required this.tweetContent});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(userName),
        subtitle: Text(tweetContent),
        trailing: Icon(Icons.favorite_border),
      ),
    );
  }
}
