import 'package:code_base/core/error/failures.dart';
import 'package:code_base/features/number_trivia/data/datasources/number_trivia_data_source.dart';
import 'package:code_base/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:code_base/features/number_trivia/domain/repositories/number_trivia_reposioty.dart';
import 'package:dartz/dartz.dart';

class NumberTriviaRepositoryImpl extends NumberTriviaRepository {
  final NumberTriviaDataSource numberTriviaRemoteDataSource;

  NumberTriviaRepositoryImpl({required this.numberTriviaRemoteDataSource});

  @override
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(
      {required int number}) async {
    try {
      final numberTrivia =
          await numberTriviaRemoteDataSource.getConcreteNumberTrivia(number);
      return Right(numberTrivia);
    } catch (e) {
      return Left(e as ServerFailure);
    }
  }

  @override
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia() async {
    try {
      final numberTrivia =
          await numberTriviaRemoteDataSource.getRandomNumberTrivia();
      return Right(numberTrivia);
    } catch (e) {
      return Left(e as ServerFailure);
    }
  }
}
