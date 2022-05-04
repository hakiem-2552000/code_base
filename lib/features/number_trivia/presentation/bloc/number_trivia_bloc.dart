import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:code_base/core/error/failures.dart';
import 'package:code_base/core/usecases/usecase.dart';
import 'package:code_base/core/utils/input_converter.dart';
import 'package:code_base/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:code_base/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:code_base/features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:equatable/equatable.dart';

part 'number_trivia_event.dart';
part 'number_trivia_state.dart';

class NumberTriviaBloc extends Bloc<NumberTriviaEvent, NumberTriviaState> {
  final GetConcreteNumberTrivia getTriviaForConcreteNumber;
  final GetRandomNumberTrivia getTriviaForRandomNumber;

  NumberTriviaBloc({
    required this.getTriviaForConcreteNumber,
    required this.getTriviaForRandomNumber,
  }) : super(Empty()) {
    on<GetTriviaForConcreteNumber>(_onGetTriviaForConcreteNumberEvent);
    on<GetTriviaForRandomNumber>(_onGetTriviaForRandomNumberEvent);
  }

  void _onGetTriviaForConcreteNumberEvent(
      GetTriviaForConcreteNumber event, Emitter<NumberTriviaState> emit) async {
    emit(Loading());
    try {
      final number = InputConverter.stringToUnsignedInteger(event.number);
      final failureOrTrivia =
          await getTriviaForConcreteNumber.call(Params(number: number));
      // TODO: define common failure message
      failureOrTrivia.fold(
          (failure) => emit(Error(message: (failure as ServerFailure).message)),
          (trivia) => emit(
                Loaded(trivia: trivia),
              ));
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }

  void _onGetTriviaForRandomNumberEvent(
      GetTriviaForRandomNumber event, Emitter<NumberTriviaState> emit) async {
    log("Random");
    emit(Loading());
    try {
      final failureOrTrivia = await getTriviaForRandomNumber.call(NoParam());
      failureOrTrivia.fold(
          (failure) => emit(Error(message: (failure as ServerFailure).message)),
          (trivia) => emit(
                Loaded(trivia: trivia),
              ));
    } catch (e) {
      emit(Error(message: e.toString()));
    }
  }
}
