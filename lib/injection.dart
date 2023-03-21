import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:prueba/features/feature/domain/usecases/post/add_post_usecases.dart';
import 'package:prueba/features/feature/domain/usecases/post/get_post_usecases.dart';
import 'package:prueba/features/feature/presentation/cubit/post/create_post/create_post_cubit.dart';

import 'features/feature/data/datasources/remote_source/remote_source.dart';
import 'features/feature/data/datasources/remote_source/remote_source_impl.dart';
import 'features/feature/data/repositories/firabase_repository_impl.dart';
import 'features/feature/domain/repositories/firabase_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
   // Post Cubit Injection
  sl.registerFactory(
        () => CreatePostCubit(createPost: sl.call(), getPost: sl.call()),
  );

  // Use Cases
  // Post
  sl.registerLazySingleton(() => CreatePostUseCase(repository: sl.call()));
  sl.registerLazySingleton(() => GetPostsUseCase(repository: sl.call()));



  // Repository

  sl.registerLazySingleton<FirebaseRepository>(() => FIrabaseRespositoryImpl(remoteSource: sl.call()));

  // Remote Data Source
  sl.registerLazySingleton<RemoteSource>(() => RemoteSourceImpl(firebaseFirestore: sl.call(), firebaseStorage: sl.call()));

  // Externals

  final firebaseFirestore = FirebaseFirestore.instance;
  final firebaseStorage = FirebaseStorage.instance;

  sl.registerLazySingleton(() => firebaseFirestore);
  sl.registerLazySingleton(() => firebaseStorage);
}