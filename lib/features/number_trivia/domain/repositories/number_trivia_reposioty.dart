import 'package:code_base/core/error/failures.dart';
import 'package:code_base/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:dartz/dartz.dart';

abstract class NumberTriviaRepository {
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(
      {required int number});
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia();
}
