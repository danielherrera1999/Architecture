// ignore_for_file: overridden_fields

import 'package:prueba/features/feature/domain/entities/post/post_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class PostModel extends PostEntity{

  final String? postId;
  final String? title;
  final String? description;

  PostModel({this.postId,this.title, this.description}):super (
    postId: postId,
    title: title,
    description: description
  );

  
  factory PostModel.fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return PostModel(
      postId: snapshot['postId'],
      title: snapshot['title'],
      description:  snapshot['description']

    );
  }

  Map<String, dynamic> toJson() => {
    "postId": postId,
    "title": title,
    "description": description,
  };
  
}