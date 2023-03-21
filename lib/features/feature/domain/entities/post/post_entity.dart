import 'package:equatable/equatable.dart';

class PostEntity extends Equatable{

  final String? postId;
  final String? title;
  final String? description;

  PostEntity({this.postId,this.title, this.description});

  @override
  List<Object?> get props => [
    postId,
    title,
    description
  ];
  
}