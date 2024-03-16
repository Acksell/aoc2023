
library;

export 'read_input.dart' show initFromLines;

import 'dart:io';

typedef InitFrom<T, In> = T Function(In input);

List<T> initFromLines<T>(String filename, InitFrom<T,String> initFrom) {
  final lines = File(filename).readAsLinesSync();
  List<T> out = [];
  
  try {
    for (var line in lines) {
      out.add(initFrom(line));
      print('$line: ${line.length} characters');
    }
    print('File is now closed.');
  } catch (e) {
    print('Error: $e');
  }
  return out;
}