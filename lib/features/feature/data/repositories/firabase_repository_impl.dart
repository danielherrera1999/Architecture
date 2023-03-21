import 'package:prueba/features/feature/data/datasources/remote_source/remote_source.dart';
import 'package:prueba/features/feature/domain/entities/post/post_entity.dart';
import 'package:prueba/features/feature/domain/repositories/firabase_repository.dart';

class FIrabaseRespositoryImpl implements FirebaseRepository {

  final RemoteSource remoteSource;

  FIrabaseRespositoryImpl({required this.remoteSource});

  
  @override
  Future<void> createPost(PostEntity post) async => remoteSource.createPost(post);

  @override
  Stream<List<PostEntity>> getPost(PostEntity post) => remoteSource.getPost(post);

}