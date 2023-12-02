import 'dart:io';
import 'dart:convert';

class Helpers {
  static Future<List<String>> getFileContentAsList(String path) async {
    final input = await File(path).readAsString();
    return const LineSplitter().convert(input);
  }

  static String getRegexFirstMatch(RegExp reg, String input) {
    final match = reg.firstMatch(input);
    if (match != null) {
      return match.group(1)!;
    } else {
      throw "Cannot determin GameId from string '$input'";
    }
  }
}
