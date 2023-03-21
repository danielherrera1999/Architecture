// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:prueba/features/feature/domain/entities/post/post_entity.dart';

class CardPost extends StatefulWidget {
  final PostEntity post;
  const CardPost({super.key, required this.post});

  @override
  State<CardPost> createState() => _CardPostState();
}

class _CardPostState extends State<CardPost> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Card(
        elevation: 5,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Text("${widget.post.title}"),
              subtitle: Text('${widget.post.description}'),
            ),
          ],
        ),
      ),
    );
  }
}