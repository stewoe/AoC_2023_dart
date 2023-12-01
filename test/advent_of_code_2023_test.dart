import 'package:test/test.dart';
import 'package:advent_of_code_2023/day1.dart' as day1;

void main() {
  test('day1.getLineValue', () {
    expect(day1.getLineValue("aa2bb3cc"), 5);
    expect(day1.getLineValue("aa22bb33cc"), 5);
    expect(day1.getLineValue("23"), 5);
  });
}
