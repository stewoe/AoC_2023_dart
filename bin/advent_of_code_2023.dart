import 'package:advent_of_code_2023/day1.dart' as day1;

void main(List<String> arguments) async {
  if(arguments.isEmpty) {
    usage();
    return;
  }

  switch(int.parse(arguments.first)) {
    case 1: print(await day1.run());
    default:
      print('Day not implemented: ${arguments.first}');
  }
}

void usage() {
  print('');
  print('Usage: ./run.sh <day>');
  print('Example: ./run.sh 2   # runs 2nd day');
}