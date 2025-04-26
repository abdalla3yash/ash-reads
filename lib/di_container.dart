import 'package:bookapp/features/books/data/data_source/book_remote_data_source.dart';
import 'package:bookapp/features/books/data/repository/book_repository_impl.dart';
import 'package:bookapp/features/books/domain/repository/book_repository.dart';
import 'package:bookapp/features/books/domain/usecase/get_books_usecase.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'core/services/network/api_client.dart';
import 'core/services/network/network_info.dart';
import 'features/books/presentation/cubit/book_cubit.dart';

final GetIt sl = GetIt.instance;

Future<void> init() async {
  // External
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<Connectivity>(() => Connectivity());
  sl.registerLazySingleton<PrettyDioLogger>(() => PrettyDioLogger(requestHeader: true, requestBody: true, responseHeader: true));

  // Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfo(sl<Connectivity>()));
  sl.registerLazySingleton<ApiClient>(() => ApiClient(sl<Dio>(), sl<PrettyDioLogger>()));

  // Data Layer
  sl.registerLazySingleton<BookRemoteDataSource>(() => BookRemoteDataSourceImpl(sl<ApiClient>()));

  // Repository
  sl.registerLazySingleton<BookRepository>(() => BookRepositoryImpl(sl<BookRemoteDataSource>()));

  // Use Case
  sl.registerLazySingleton(() => GetBooksUseCase(sl<BookRepository>()));

  // Cubit
  sl.registerFactory(() => BookCubit(sl<GetBooksUseCase>()));
}
