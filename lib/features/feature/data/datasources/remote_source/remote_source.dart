import 'package:prueba/features/feature/domain/entities/post/post_entity.dart';

abstract class RemoteSource {
  //posts
  Future<void> createPost(PostEntity post);
  Stream<List<PostEntity>> getPost(PostEntity post);
}