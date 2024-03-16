import "package:characters/characters.dart"; 

class CalibrationLine{
  final String input;
  final int first;
  final int last;

  CalibrationLine(this.input, this.first, this.last);

  static CalibrationLine fromString(String s) {
    int? first;
    int? last;
    for (var c in s.characters) {
      var d = int.tryParse(c);
      first ??= d; // set if nil
      if (d != null) {
        last = d;
      }
    }
    if (first == null || last == null) {
      throw Exception('Failed to parse first or last digit');
    }
    return CalibrationLine(s, first, last);
  }

  int sum() {
    return first+last;
  }
}