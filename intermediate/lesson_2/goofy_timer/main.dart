import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());
var timerController = TimerController();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      routes: {
        'home': (context) => HomePage(controller: timerController),
        'timer': (context) => TimerPage(controller: timerController)
      },
      initialRoute: 'home',
    );
  }
}

class HomePage extends StatelessWidget {
  final TimerController controller;

  HomePage({this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: CupertinoTimerPicker(
          mode: CupertinoTimerPickerMode.ms,
          onTimerDurationChanged: onDurationChanged,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.timer),
        onPressed: () => Navigator.of(context).pushNamed('timer'),
      ),
    );
  }

  void onDurationChanged(Duration value) {
    controller.setDuration(value);
  }
}

class TimerPage extends StatefulWidget {
  final TimerController controller;

  TimerPage({this.controller});

  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  @override
  void initState() {
    super.initState();

    timerController.registerCallback(() {
      setState(() {});
    });

    timerController.startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timer'),
      ),
      body: Center(
        child: Text(
          timerController.getTime(),
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.stop),
        onPressed: () {
          widget.controller.stopTimer();
          return Navigator.of(context).pushNamed('home');
        },
      ),
    );
  }
}

class TimerController {
  Duration duration = Duration.zero;
  AnimationController timer;
  bool start = false;
  List<VoidCallback> callbacks = [];

  DateTime startTime;

  void setDuration(Duration duration) {
    this.duration = duration;
  }

  void registerCallback(VoidCallback function) {
    callbacks.add(function);
  }

  void startTimer() {
    start = true;
    startTime = DateTime.now();

    runTimer();
  }

  void stopTimer() {
    start = false;
  }

  String getTime() {
    if (startTime == null) {
      return Duration.zero.toString();
    } else {
      Duration minusDuration = startTime.difference(DateTime.now());
      Duration result = duration + minusDuration;
      return (result.toString());
    }
  }

  void runTimer() async {
    await Future(() {});
    callbacks.forEach((element) {
      element.call();
    });
    if (start) {
      runTimer();
    }
  }
}
