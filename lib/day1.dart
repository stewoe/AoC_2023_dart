import 'package:advent_of_code_2023/helpers.dart' as helpers;
import 'package:collection/collection.dart';

Future<String> run() async {
  final lines = await helpers.getFileContentAsList("files/input-day1.txt");

  final sum1 = lines
    .map(getLineValue)
    .sum;
  
  final sum2 = lines
    .map(getNormalizedLine)
    .map(getLineValue)
    .sum;

  return "Part 1: $sum1\nPart2: $sum2";
}

int getLineValue(String line) {  
  final integersRegEx =  RegExp(r'(\d{1,1})');
  final matches = integersRegEx.allMatches(line);
  
  if(matches.first[0] == null || matches.last[0] == null) {
    return 0;
  }
  
  return int.parse(matches.first[0]! + matches.last[0]!);
}

String getNormalizedLine(String line) {
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