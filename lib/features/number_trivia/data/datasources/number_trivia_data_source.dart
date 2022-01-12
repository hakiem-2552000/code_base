import 'package:code_base/core/error/failures.dart';
import 'package:code_base/core/network/network_service.dart';
import 'package:code_base/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:dio/dio.dart';

abstract class NumberTriviaDataSource {
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number);

  Future<NumberTriviaModel> getRandomNumberTrivia();
}

class NumberTriviaRemoteDataSourceImpl extends NumberTriviaDataSource {
  NumberTriviaRemoteDataSourceImpl(this.networkService);

  final NetworkService networkService;

  @override
  Future<NumberTriviaModel> getConcreteNumberTrivia(int number) async {
    try {
      final response = await networkService.dio.get('$number?json');
      return NumberTriviaModel.fromJson(response.data);
    } on DioError catch (e, _) {
      return Future.error(e.error as ServerFailure);
    } on Exception catch (e) {
      return Future.error(e as ServerFailure);
    }
  }

  @override
  Future<NumberTriviaModel> getRandomNumberTrivia() async {
    try {
      final response = await networkService.dio.get(APIRoute.random.path);
      return NumberTriviaModel.fromJson(response.data);
    } on DioError catch (e, _) {
      return Future.error(e.error as ServerFailure);
    } on Exception catch (e) {
      return Future.error(e as ServerFailure);
    }
  }
}
