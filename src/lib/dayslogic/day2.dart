import 'package:aoc2023/dayslogic/helpers.dart';
import 'package:collection/collection.dart';

class Day2 {
  static Future<String> run1() async {
    final lines = await Helpers.getFileContentAsList("lib/input/input-day2.txt");
    final games = lines.map((line) => GameInfo.parse(line));
    final bag = Cubes(red: 12, green: 13, blue: 14);
    
    final possibleGames = games.where((game) => game.isPossible(bag));
    final sumOfPossible = possibleGames.fold(0, (acc, game) => acc + game.id);
    
    return sumOfPossible.toString();
  }

  static Future<String> run2() async {
    final lines = await Helpers.getFileContentAsList("lib/input/input-day2.txt");
    final games = lines.map((line) => GameInfo.parse(line));
    
    final sumOfPowers = games
      .map((game) => game.power())
      .sum;
    
    return sumOfPowers.toString();
  }
}

class Cubes {
  final int blue;
  final int red;
  final int green;

  Cubes({required this.blue, required this.red, required this.green});

  @override
  String toString() => "$red red, $green green, $blue blue";
}

class GameInfo {
  final int id;
  final List<Cubes> rounds;

  GameInfo({
    required this.id,
    required this.rounds,
  });

  static GameInfo parse(String input) {
    final reg = RegExp(r" (\d+)\:");
    final gameId = int.parse(Helpers.getRegexFirstMatch(reg, input));

    List<Cubes> rounds = [];
    final roundsStr = input.split(":")[1].split(";");
    for (final roundStr in roundsStr) {
      rounds.add(parseRound(roundStr));
    }

    return GameInfo(id: gameId, rounds: rounds);
  }

  static Cubes parseRound(String input) {
    final draws = input.split(",").map((e) => e.trim());
    var red = 0;
    var green = 0;
    var blue = 0;

    for (final draw in draws) {
      final drawInfo = draw.split(" ");
      if (drawInfo[1] == "red") {
        red = int.parse(drawInfo[0]);
      }
      if (drawInfo[1] == "green") {
        green = int.parse(drawInfo[0]);
      }
      if (drawInfo[1] == "blue") {
        blue = int.parse(drawInfo[0]);
      }
    }

    return Cubes(red: red, green: green, blue: blue);
  }

  @override
  String toString() => "Game $id: ${rounds.map((r) => r.toString()).join("; ")}";

  bool isPossible(Cubes bag) => rounds.where((round) => round.red > bag.red || round.green > bag.green || round.blue > bag.blue)
                                      .isEmpty;

  int power() {
    final maxRed = rounds
      .map((round) => round.red)
      .reduce((curr, next) => curr > next ? curr : next);
    final maxGreen = rounds
      .map((round) => round.green)
      .reduce((curr, next) => curr > next ? curr : next);
    final maxBlue = rounds
      .map((round) => round.blue)
      .reduce((curr, next) => curr > next ? curr : next);
    
    return maxRed * maxGreen * maxBlue;
  }
}

