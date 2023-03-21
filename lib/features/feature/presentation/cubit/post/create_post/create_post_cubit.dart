import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:prueba/features/feature/domain/usecases/post/add_post_usecases.dart';

import '../../../../domain/entities/post/post_entity.dart';
import '../../../../domain/usecases/post/get_post_usecases.dart';

part 'create_post_state.dart';

class CreatePostCubit extends Cubit<CreatePostState> {

  final CreatePostUseCase createPost;
  final GetPostsUseCase getPost;

  CreatePostCubit({required this.createPost, required this.getPost}) : super(CreatePostInitial());

  Future<void> create({required PostEntity post}) async {
    try {
      await createPost.call(post);
    } on SocketException catch(_) {
      emit(CreatePostFailure());
    } catch (_) {
      emit(CreatePostFailure());
    }
  }

  Future<void> getPosts({required PostEntity post}) async {
    emit(CreatePostLoading());
    try {
      final streamResponse = getPost.call(post);
      streamResponse.listen((posts) {
        emit(CreatePostLoaded(posts: posts));
      });
    } on SocketException catch(_) {
      emit(CreatePostFailure());
    } catch (_) {
      emit(CreatePostFailure());
    }
  }
}
