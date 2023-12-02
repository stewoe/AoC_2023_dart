import 'package:aoc2023/dayslogic/helpers.dart';
import 'package:collection/collection.dart';

class Day1 {
  static Future<String> run1() async {
    final lines = await Helpers.getFileContentAsList("lib/input/input-day1.txt");
    final sum = lines
        .map(_getLineValue)
        .sum;
    
    return sum.toString();
  }

  static Future<String> run2() async {
    final lines = await Helpers.getFileContentAsList("lib/input/input-day1.txt");
    final sum = lines
        .map(_getNormalizedLine)
        .map(_getLineValue)
        .sum;
      
    return sum.toString();
  }

  static int _getLineValue(String line) {  
    final integersRegEx =  RegExp(r'(\d{1,1})');
    final matches = integersRegEx.allMatches(line);
    
    if(matches.first[0] == null || matches.last[0] == null) {
      return 0;
    }
    
    return int.parse(matches.first[0]! + matches.last[0]!);
  }

  static String _getNormalizedLine(String line) {
    return line
      .replaceAll('one', 'one1one')
      .replaceAll('two', 'two2two')
      .replaceAll('three', 'three3three')
      .replaceAll('four', 'four4four')
      .replaceAll('five', 'five5five')
      .replaceAll('six', 'six6six')
      .replaceAll('seven', 'seven7seven')
      .replaceAll('eight', 'eight8eight')
      .replaceAll('nine', 'nine9nine');
  }
}