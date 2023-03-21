// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba/features/feature/presentation/pages/post/post_page.dart';
import 'features/feature/presentation/cubit/post/create_post/create_post_cubit.dart';
import 'injection.dart' as di;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<CreatePostCubit>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "post",
        darkTheme: ThemeData.dark(),
        home: PostPage(),
      ),
    );
  }
}


