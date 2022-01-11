import 'package:code_base/core/error/failures.dart';
import 'package:code_base/core/usecases/usecase.dart';
import 'package:code_base/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:code_base/features/number_trivia/domain/repositories/number_trivia_reposioty.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class GetConcreteNumberTrivia implements UseCase<NumberTrivia, Params> {
  final NumberTriviaRepository repository;
  const GetConcreteNumberTrivia(this.repository);

  @override
  Future<Either<Failure, NumberTrivia>> call(Params params) async {
    return await repository.getConcreteNumberTrivia(number: params.number);
  }
}

class Params extends Equatable {
  final int number;
  const Params({required this.number});

  @override
  List<Object?> get props => [];
}
