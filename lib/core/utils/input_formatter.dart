import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';

class MaskedTextInputFormatter extends TextInputFormatter {
  final String mask;
  final String separator;

  MaskedTextInputFormatter({
    required this.mask,
    required this.separator,
  });

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isNotEmpty) {
      if (newValue.text.length > oldValue.text.length) {
        if (newValue.text.length > mask.length) return oldValue;
        if (newValue.text.length < mask.length &&
            mask[newValue.text.length - 1] == separator) {
          return TextEditingValue(
            text:
                '${oldValue.text}$separator${newValue.text.substring(newValue.text.length - 1)}',
            selection: TextSelection.collapsed(
              offset: newValue.selection.end + 1,
            ),
          );
        }
      }
    }
    return newValue;
  }
}

class CardExpirationFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final newValueString = newValue.text;
    String valueToReturn = '';

    for (int i = 0; i < newValueString.length; i++) {
      if (newValueString[i] != '/') valueToReturn += newValueString[i];
      var nonZeroIndex = i + 1;
      final contains = valueToReturn.contains(RegExp(r'\/'));
      if (nonZeroIndex % 2 == 0 &&
          nonZeroIndex != newValueString.length &&
          !contains) {
        valueToReturn += '/';
      }
    }
    return newValue.copyWith(
      text: valueToReturn,
      selection: TextSelection.fromPosition(
        TextPosition(offset: valueToReturn.length),
      ),
    );
  }
}

class CardMonthInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var newText = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = StringBuffer();
    final year = getYear();
    final firstYear = int.parse(year[0]);
    final secondYear = int.parse(year[1]);

    for (int i = 0; i < newText.length; i++) {
      if (i == 0) {
        if (newText[0] == '0' || newText[0] == '1') {
          buffer.write(newText[i]);
        }
      } else if (i == 1) {
        if (newText[0] == '0' && newText[1] != '0') {
          buffer.write(newText[i]);
        }
        if (newText[0] == '1' &&
            (newText[1] == '0' || newText[1] == '1' || newText[1] == '2')) {
          buffer.write(newText[i]);
        }
      } else if (i == 2) {
        if (int.parse(newText[i]) >= firstYear) {
          buffer.write(newText[i]);
        }
      } else if (i == 3) {
        if (int.parse(newText[2]) == firstYear &&
            int.parse(newText[i]) >= secondYear) {
          buffer.write(newText[i]);
        }
        if (int.parse(newText[2]) > firstYear) {
          buffer.write(newText[i]);
        }
      }
      if (buffer.length == 2 && buffer.length != newText.length) {
        buffer.write('/');
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }

  String getYear() {
    var now = DateTime.now();
    var formatter = DateFormat('yy-MM-dd');
    String formattedDate = formatter.format(now);
    return formattedDate;
  }
}

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 4 == 0 && nonZeroIndex != text.length) {
        buffer.write('  '); // Add double spaces.
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return newValue.copyWith(text: newValue.text.toUpperCase());
  }
}

class PostalCodeTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    int dashCount = 0;

    for (var char in newValue.text.split('')) {
      if (char == '-') {
        dashCount++;
      }
    }
    if (dashCount > 1) {
      final splitText = newValue.text.split('-');
      if (splitText.isNotEmpty) {
        String newText = '${splitText.first}-';
        for (int i = 1; i < splitText.length; i++) {
          newText += splitText[i];
        }
        return newValue.copyWith(
            text: newText,
            selection: TextSelection.fromPosition(
                TextPosition(offset: newText.length)));
      }
    }
    return newValue;
  }
}
