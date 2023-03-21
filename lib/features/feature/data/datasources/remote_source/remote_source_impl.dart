// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:prueba/const.dart';
import 'package:prueba/features/feature/data/datasources/remote_source/remote_source.dart';
import 'package:prueba/features/feature/data/models/post_model.dart';
import 'package:prueba/features/feature/domain/entities/post/post_entity.dart';

class RemoteSourceImpl extends RemoteSource {

  final FirebaseFirestore firebaseFirestore;
  final FirebaseStorage firebaseStorage;

  RemoteSourceImpl({required this.firebaseFirestore, required this.firebaseStorage});

  @override
  Future<void> createPost(PostEntity post) async {
    final postCollection = firebaseFirestore.collection(FirebaseConst.post);

    final newPost = PostModel(
      title: post.title,
      description: post.description
    ).toJson();

    try {

      final postDocRef = await postCollection.doc(post.postId).get();
      
      if (!postDocRef.exists) {
        postCollection.doc(post.postId).set(newPost);
      } else {
        postCollection.doc(post.postId).update(newPost);
      }
    }catch (e) {
      print("Ocurrio un problema $e");
    }
  }

  @override
  Stream<List<PostEntity>> getPost(PostEntity post) {
    final postCollection = firebaseFirestore.collection(FirebaseConst.post);
    return postCollection.snapshots().map((querySnapshot) => querySnapshot.docs.map((e) => PostModel.fromSnapshot(e)).toList());
  }

}