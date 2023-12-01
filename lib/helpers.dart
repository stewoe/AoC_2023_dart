import 'dart:io';
import 'dart:convert';

Future<List<String>> getFileContentAsList(String path) async {
  final input = await File(path).readAsString();
  return LineSplitter().convert(input);
}