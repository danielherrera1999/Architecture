import 'package:prueba/features/feature/domain/entities/post/post_entity.dart';
import 'package:prueba/features/feature/domain/repositories/firabase_repository.dart';

class GetPostsUseCase {
  final FirebaseRepository repository;

  GetPostsUseCase({required this.repository});

  Stream<List<PostEntity>> call(PostEntity post) {
    return repository.getPost(post);
  }
}