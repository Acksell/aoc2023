library;

export 'runner.dart' show Runner;

import 'package:flutter/material.dart';

enum RunState { init, running, finished}

class Runner extends StatefulWidget {
  const Runner({super.key, required this.program});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final Future<String> Function() program;

  @override
  State<Runner> createState() => _RunnerState();
}

class _RunnerState extends State<Runner> {
  RunState state = RunState.init;

  String result = "";

  run() async {
    setState(() {
      state = RunState.running;
    });
    
    result = await widget.program.call();

    setState(() {
      state = RunState.finished;
    });
  }

  String displayText() {
    switch (state) {
      case RunState.finished:
        return result;
      case RunState.init:
        return "Click button to run the program!";
      case RunState.running:
        return "Running...";
      default:
        return "Oops, something went wrong";
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  Center(
      // Center is a layout widget. It takes a single child and positions it
      // in the middle of the parent.
      child: Column(
        // Column is also a layout widget. It takes a list of children and
        // arranges them vertically. By default, it sizes itself to fit its
        // children horizontally, and tries to be as tall as its parent.
        //
        // Column has various properties to control how it sizes itself and
        // how it positions its children. Here we use mainAxisAlignment to
        // center the children vertically; the main axis here is the vertical
        // axis because Columns are vertical (the cross axis would be
        // horizontal).
        //
        // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
        // action in the IDE, or press "p" in the console), to see the
        // wireframe for each widget.
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            // disable button by passing null value for onPressed.
            onPressed: state == RunState.init ? run : null, 
            icon: Icon(
            switch (state) {
              RunState.finished => Icons.check,
              RunState.init => Icons.play_arrow,
              RunState.running => Icons.access_time
            }
          ),),
          Text(
            displayText(),
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ],
      ),
    );
  }
}