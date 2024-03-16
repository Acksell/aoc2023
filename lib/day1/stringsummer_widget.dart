import 'package:aoc2023/day1/stringsummer.dart';
import 'package:aoc2023/io/read_input.dart';
import 'dart:async';
import 'package:aoc2023/widgets/runner/runner.dart';

Future<String> run() async {
  var lines = initFromLines("C:\\Users\\axeng\\Desktop\\dev\\home\\src\\aoc2023\\lib\\day1\\input.txt", CalibrationLine.fromString);
  var sum = 0;
  for (var line in lines) {
    // print("${line.input}, ${line.first}, ${line.last}, ${line.sum()}, ${int.parse("${line.first}${line.last}")}}");
    sum += int.parse("${line.first}${line.last}");
  }
  await Future.delayed(const Duration(milliseconds: 3000));
  return sum.toString();
}

class StringSummer extends Runner {
  const StringSummer({super.key}) : super(program: run);
}