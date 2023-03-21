// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba/features/feature/presentation/cubit/post/create_post/create_post_cubit.dart';

import '../../../../../const.dart';
import '../../../domain/entities/post/post_entity.dart';
import '../../widgets/card_widget.dart';
import 'components/form.dart';
import '../../../../../injection.dart' as di;

class PostPage extends StatefulWidget {
  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<CreatePostCubit>(
        create: (context) =>
        di.sl<CreatePostCubit>()
          ..getPosts(post: PostEntity()),
        child: BlocBuilder<CreatePostCubit, CreatePostState>(
          builder: (context, createPostState) {
            if (createPostState is CreatePostLoading) {
              return Center(child: CircularProgressIndicator(),);
            }
            if (createPostState is CreatePostFailure) {
              toast("Some Failure occured while creating the post");
            }
            if (createPostState is CreatePostLoaded) {
              return createPostState.posts.isEmpty? _noPostsYetWidget() : ListView.builder(
                itemCount: createPostState.posts.length,
                itemBuilder: (context, index) {
                  final post = createPostState.posts[index];
                  return BlocProvider(
                    create: (context) => di.sl<CreatePostCubit>(),
                    child: CardPost(post: post),
                  );
                },
              );
            }
            return Center(child: CircularProgressIndicator(),);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => FormAdd()));
        },
        backgroundColor: Colors.blue[400],
        child: const Icon(Icons.add),
      ),
    );
  }

  _noPostsYetWidget() {
    return Center(child: Text("No existe posts", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),);
  }
}