import 'dart:developer';

import 'package:code_base/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:dio/dio.dart';

abstract class NumberTriviaDataSource {
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number);
  Future<NumberTriviaModel> getRandomNumberTrivia();
}

class NumberTriviaRemoteDataSourceImpl extends NumberTriviaDataSource {
  final dio = Dio();

  @override
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number) async {
    dio.options.headers['Content-Type'] = 'application/json';
    final response = await dio.get(
      'http://numbersapi.com/$number?json',
    );
    return NumberTriviaModel.fromJson(response.data);
  }

  @override
  Future<NumberTriviaModel> getRandomNumberTrivia() async {
    dio.options.headers['Content-Type'] = 'application/json';
    final response = await dio.get(
      'http://numbersapi.com/random?json',
    );
    return NumberTriviaModel.fromJson(response.data);
  }
}
