import 'package:code_base/core/error/failures.dart';

class InputConverter {
  static int stringToUnsignedInteger(String str) {
    final integer = int.parse(str);
    if (integer < 0) throw const FormatException();
    return integer;
  }
}

class InvalidInputFailure extends Failure {}
