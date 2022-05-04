import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

mixin DebounceMixin {
  EventTransformer<T> debounce<T>(
      {Duration duration = const Duration(milliseconds: 300)}) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }
}
