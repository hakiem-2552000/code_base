import 'package:code_base/features/number_trivia/data/datasources/number_trivia_data_source.dart';
import 'package:code_base/features/number_trivia/data/repositoies/number_trivia_repository_impl.dart';
import 'package:code_base/features/number_trivia/domain/repositories/number_trivia_reposioty.dart';
import 'package:code_base/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:code_base/features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:code_base/features/number_trivia/presentation/bloc/number_trivia_bloc.dart';
import 'package:get_it/get_it.dart';

import 'core/services/network/network_infor.dart';
import 'core/services/network/network_service.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Features - Number Trivia
  sl.registerFactory(
    () => NumberTriviaBloc(
      getTriviaForConcreteNumber: sl(),
      getTriviaForRandomNumber: sl(),
    ),
  );
  // Use Case
  sl.registerLazySingleton(() => GetConcreteNumberTrivia(sl()));
  sl.registerLazySingleton(() => GetRandomNumberTrivia(sl()));

  // Repository
  sl.registerLazySingleton<NumberTriviaRepository>(
      () => NumberTriviaRepositoryImpl(numberTriviaRemoteDataSource: sl()));

  // Data source
  sl.registerLazySingleton<NumberTriviaDataSource>(
      () => NumberTriviaRemoteDataSourceImpl(sl()));

  // Core
  sl.registerLazySingleton<NetworkService>(
      () => NetworkService(networkInforImplement: sl()));
  sl.registerLazySingleton<NetworkInforImplement>(
      () => NetworkInforImplement());
}
