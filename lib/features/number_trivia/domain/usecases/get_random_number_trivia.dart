import 'package:code_base/core/error/failures.dart';
import 'package:code_base/core/usecases/usecase.dart';
import 'package:code_base/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:code_base/features/number_trivia/domain/repositories/number_trivia_reposioty.dart';
import 'package:dartz/dartz.dart';

class GetRandomNumberTrivia implements UseCase<NumberTrivia, NoParam> {
  final NumberTriviaRepository repository;
  const GetRandomNumberTrivia(this.repository);

  @override
  Future<Either<Failure, NumberTrivia>> call(NoParam params) async {
    return await repository.getRandomNumberTrivia();
  }
}
