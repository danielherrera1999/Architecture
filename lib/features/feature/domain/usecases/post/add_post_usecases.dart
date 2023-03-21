// ignore_for_file: non_constant_identifier_names

import 'package:prueba/features/feature/domain/entities/post/post_entity.dart';

import '../../repositories/firabase_repository.dart';

class CreatePostUseCase{
  final FirebaseRepository repository;

  CreatePostUseCase({required this.repository});

  Future<void> call(PostEntity post){
    return repository.createPost(post);
  }
}