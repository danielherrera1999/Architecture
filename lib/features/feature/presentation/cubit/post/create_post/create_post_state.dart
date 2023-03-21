// ignore_for_file: prefer_const_constructors_in_immutables

part of 'create_post_cubit.dart';

abstract class CreatePostState extends Equatable {
  const CreatePostState();
}

class CreatePostInitial extends CreatePostState {
  @override
  List<Object> get props => [];
}

class CreatePostLoading extends CreatePostState {
  @override
  List<Object> get props => [];
}

class CreatePostLoaded extends CreatePostState {
  final List<PostEntity> posts;

  CreatePostLoaded({required this.posts});
  @override
  List<Object> get props => [posts];
}

class CreatePostFailure extends CreatePostState {
  @override
  List<Object> get props => [];
}
