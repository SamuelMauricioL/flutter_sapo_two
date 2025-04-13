import 'package:get_it/get_it.dart';
import 'package:st_post_data/st_post_data.dart';
import 'package:st_post_domain/st_post_domain.dart';
import 'package:st_utils/st_utils.dart';

class PostModule extends ModuleDi {
  PostModule(this.getIt);

  final GetIt getIt;

  @override
  void registerModule() {
    _registerDataSource();
    _registerRepository();
    _registerUseCases();
  }

  void _registerDataSource() {
    getIt.registerLazySingleton<PostRemoteDataSource>(
      PostRemoteDataSourceImpl.new,
    );
  }

  void _registerRepository() {
    getIt.registerLazySingleton<PostRepository>(
      () => PostRepositoryImpl(
        remoteDataSource: getIt<PostRemoteDataSource>(),
      ),
    );
  }

  void _registerUseCases() {
    getIt
      ..registerLazySingleton<GetPostsUseCase>(
        () => GetPostsUseCase(
          repository: getIt<PostRepository>(),
        ),
      )
      ..registerLazySingleton<LikePostUseCase>(
        () => LikePostUseCase(
          repository: getIt<PostRepository>(),
        ),
      )
      ..registerLazySingleton<DislikePostUseCase>(
        () => DislikePostUseCase(
          repository: getIt<PostRepository>(),
        ),
      );
  }
}
